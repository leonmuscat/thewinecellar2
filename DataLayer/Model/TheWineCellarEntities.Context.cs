﻿//------------------------------------------------------------------------------
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
    using System.Data.Entity;
    using System.Data.Entity.Infrastructure;
    
    public partial class TheWineCellarEntities : DbContext
    {
        public TheWineCellarEntities()
            : base("name=TheWineCellarEntities")
        {
        }
    
        protected override void OnModelCreating(DbModelBuilder modelBuilder)
        {
            throw new UnintentionalCodeFirstException();
        }
    
        public virtual DbSet<platform_user> platform_user { get; set; }
        public virtual DbSet<product> products { get; set; }
        public virtual DbSet<product_group> product_group { get; set; }
        public virtual DbSet<sysdiagram> sysdiagrams { get; set; }
        public virtual DbSet<transaction> transactions { get; set; }
        public virtual DbSet<transaction_product> transaction_product { get; set; }
    }
}
