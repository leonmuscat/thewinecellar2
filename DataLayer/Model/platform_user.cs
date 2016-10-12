//------------------------------------------------------------------------------
// <auto-generated>
//     This code was generated from a template.
//
//     Manual changes to this file may cause unexpected behavior in your application.
//     Manual changes to this file will be overwritten if the code is regenerated.
// </auto-generated>
//------------------------------------------------------------------------------

namespace DataLayer.Model
{
    using System;
    using System.Collections.Generic;
    using System.ComponentModel.DataAnnotations;
    using System.ComponentModel.DataAnnotations.Schema;
    [Table ("platform_user")]
    public partial class platform_user
    {
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2214:DoNotCallOverridableMethodsInConstructors")]
        public platform_user()
        {
            this.transactions = new HashSet<transaction>();
        }

        public platform_user(string _name, string _surname, string _email, string _password, 
            string _shipping_address, string _city, string _zip, string _phone)
        {
            this.name = _name;
            this.surname = _surname;
            this.email = _email;
            this.password = _password;
            this.shipping_address = _shipping_address;
            this.city = _city;
            this.zip = _zip;
            this.phone = _phone;
        }

        [Key]
        [DatabaseGenerated(DatabaseGeneratedOption.Identity)]
        public long id { get; set; }

        public string name { get; set; }
        public string surname { get; set; }
        public string shipping_address { get; set; }
        public string city { get; set; }
        public string zip { get; set; }
        public string phone { get; set; }
        public string email { get; set; }
        public string password { get; set; }
    
        [System.Diagnostics.CodeAnalysis.SuppressMessage("Microsoft.Usage", "CA2227:CollectionPropertiesShouldBeReadOnly")]
        public virtual ICollection<transaction> transactions { get; set; }
    }
}
