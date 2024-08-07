﻿using System;
using System.ComponentModel;

namespace DomainModelLayer
{
    public class Order
    {
        [DisplayName("ID")]
        public int Id { get; set; }

        [DisplayName("Fecha de creación")]
        public DateTime CreationDate { get; set; }

        [DisplayName("Fecha de entrega")]
        public DateTime DeliveryDate { get; set; }

        [DisplayName("Domicilio de entrega")]
        public Address DeliveryAddress { get; set; }

        [DisplayName("Estado")]
        public OrderStatus OrderStatus { get; set; }

        [DisplayName("Usuario")]
        public User User { get; set; }

        [DisplayName("Canal de distribución")]
        public DistributionChannel DistributionChannel { get; set; }

        [DisplayName("Medio de pago")]
        public PaymentType PaymentType { get; set; }

        public Order()
        {
            DeliveryAddress = new Address();
            OrderStatus = new OrderStatus();
            User = new User();
            DistributionChannel = new DistributionChannel();
            PaymentType = new PaymentType();
        }
    }
}
