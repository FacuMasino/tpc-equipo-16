﻿using System;
using System.ComponentModel;

namespace DomainModelLayer
{
    public class Person
    {
        [DisplayName("ID")]
        public int Id { get; set; }

        [DisplayName("Estado")]
        public bool Status { get; set; }

        [DisplayName("Nombre")]
        public string FirstName { get; set; }

        [DisplayName("Apellido")]
        public string LastName { get; set; }

        [DisplayName("DNI/CUIL/CUIT")]
        public string TaxCode { get; set; }

        [DisplayName("Teléfono")]
        public string Phone { get; set; }

        [DisplayName("Email")]
        public string Email { get; set; }

        [DisplayName("Nacimiento")]
        public DateTime Birth { get; set; }

        [DisplayName("Domicilio")]
        public Address Address { get; set; }
    }
}
