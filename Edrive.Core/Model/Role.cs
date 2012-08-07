
using System;
using System.Collections.Generic;
using System.ComponentModel.DataAnnotations;
using System.Runtime.Serialization;

namespace Edrive.Core.Model
{
    [DataContract]
    [DisplayColumn("RoleName")]
    public partial class Role
    {
        [DataMember]
        public virtual Guid RoleId { get; set; }

        [Required]
        [DataMember]
        public virtual string RoleName { get; set; }

        [DataMember]
        public virtual string Description { get; set; }

        [DataMember]
        public virtual ICollection<User> Users { get; set; }
    }
}