
using System;
using System.Linq;
using System.Web.Security;
using Edrive.Core.Model;
	using Edrive.Data;
	
namespace Edrive.Membership.Providers
{
    public class CodeFirstRoleProvider : RoleProvider
    {
		private string _applicationName; 

        public override string ApplicationName
        {
			get { return _applicationName; }
            set { _applicationName = GetType().Assembly.GetName().Name; 
			}
        }
		
        public override bool RoleExists(string roleName)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return false;
            }
            using (var context = new DataContext())
            {
                Role role = context.Roles.FirstOrDefault(rl => rl.RoleName == roleName);
                if (role != null)
                {
                    return true;
                }
                return false;
            }
        }

        public override bool IsUserInRole(string username, string roleName)
        {
            if (string.IsNullOrEmpty(username))
            {
                return false;
            }
            if (string.IsNullOrEmpty(roleName))
            {
                return false;
            }
            using (var context = new DataContext())
            {
                User user = context.Users.FirstOrDefault(usr => usr.Username == username);
                if (user == null)
                {
                    return false;
                }
                Role role = context.Roles.FirstOrDefault(rl => rl.RoleName == roleName);
                return role != null && user.Roles.Contains(role);
            }
        }

        public override string[] GetAllRoles()
        {
            using (var context = new DataContext())
            {
                return context.Roles.Select(rl => rl.RoleName).ToArray();
            }
        }

        public override string[] GetUsersInRole(string roleName)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return null;
            }
            using (var context = new DataContext())
            {
                Role role = context.Roles.FirstOrDefault(rl => rl.RoleName == roleName);
                if (role != null)
                {
                    return role.Users.Select(usr => usr.Username).ToArray();
                }
                return null;
            }
        }

        public override string[] GetRolesForUser(string username)
        {
            if (string.IsNullOrEmpty(username))
            {
                return null;
            }
            using (var context = new DataContext())
            {
                User user = context.Users.FirstOrDefault(usr => usr.Username == username);
                if (user != null)
                {
                    return user.Roles.Select(rl => rl.RoleName).ToArray();
                }
                return null;
            }
        }

        public override string[] FindUsersInRole(string roleName, string usernameToMatch)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return null;
            }

            if (string.IsNullOrEmpty(usernameToMatch))
            {
                return null;
            }

            using (var context = new DataContext())
            {
                return (from rl in context.Roles
                        from usr in rl.Users
                        where rl.RoleName == roleName && usr.Username.Contains(usernameToMatch)
                        select usr.Username).ToArray();
            }
        }

        public override void CreateRole(string roleName)
        {
            if (!string.IsNullOrEmpty(roleName))
            {
                using (var context = new DataContext())
                {
                    Role role = context.Roles.FirstOrDefault(rl => rl.RoleName == roleName);
                    if (role == null)
                    {
                        var newRole = new Role
                            {
                                RoleId = Guid.NewGuid(),
                                RoleName = roleName
                            };
                        context.Roles.Add(newRole);
                        context.SaveChanges();
                    }
                }
            }
        }

        public override bool DeleteRole(string roleName, bool throwOnPopulatedRole)
        {
            if (string.IsNullOrEmpty(roleName))
            {
                return false;
            }
            using (var context = new DataContext())
            {
                Role role = context.Roles.FirstOrDefault(rl => rl.RoleName == roleName);
                if (role == null)
                {
                    return false;
                }
                if (throwOnPopulatedRole)
                {
                    if (role.Users.Any())
                    {
                        return false;
                    }
                }
                else
                {
                    role.Users.Clear();
                }
                context.Roles.Remove(role);
                context.SaveChanges();
                return true;
            }
        }

        public override void AddUsersToRoles(string[] usernames, string[] roleNames)
        {
            using (var context = new DataContext())
            {
                var users = context.Users.Where(usr => usernames.Contains(usr.Username)).ToList();
                var roles = context.Roles.Where(rl => roleNames.Contains(rl.RoleName)).ToList();
                foreach (var user in users)
                {
                    foreach (var role in roles)
                    {
                        if (!user.Roles.Contains(role))
                        {
                            user.Roles.Add(role);
                        }
                    }
                }
                context.SaveChanges();
            }
        }

        public override void RemoveUsersFromRoles(string[] usernames, string[] roleNames)
        {
            using (var context = new DataContext())
            {
                foreach (var username in usernames)
                {
                    var us = username;
                    var user = context.Users.FirstOrDefault(u => u.Username == us);
                    if (user != null)
                    {
                        foreach (var roleName in roleNames)
                        {
                            var rl = roleName;
                            var role = user.Roles.FirstOrDefault(r => r.RoleName == rl);
                            if (role != null)
                            {
                                user.Roles.Remove(role);
                            }
                        }
                    }
                }
                context.SaveChanges();
            }
        }
    }
}