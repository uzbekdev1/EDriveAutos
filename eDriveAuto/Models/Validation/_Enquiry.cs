﻿using System;
using System.ComponentModel.DataAnnotations;
using System.Linq;
using System.Web.Mvc;
using Edrive.Edrivie_Service_Ref;
using Edrive.Models;

namespace Edrive.Models
{
    public class _Enquiry
    {
        [Required]
        public String FullName { get; set; }
        [Required]
        public String Enquiry { get; set; }
        [Required]
        [RegularExpression(@"^([a-zA-Z0-9_\-\.]+)@[a-z0-9-]+(\.[a-z0-9-]+)*(\.[a-z]{2,3})$", ErrorMessage = "Wrong Email")]
        public String Email { get; set; }
        [Required]
        public String Phone { get; set; }

    }
}