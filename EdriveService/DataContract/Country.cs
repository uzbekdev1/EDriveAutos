﻿using System;
using System.Linq;
using System.Runtime.Serialization;

namespace EdriveService.DataContract
{
    [DataContract]
    public class Country
    {
        [DataMember]
        public int CountryID { get; set; }
        [DataMember]
        public String Name { get; set; }
        [DataMember]
        public int DisplayOrder { get; set; }


    }


    
}