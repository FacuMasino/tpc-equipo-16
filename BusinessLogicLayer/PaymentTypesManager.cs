﻿using System;
using DataAccessLayer;
using DomainModelLayer;

namespace BusinessLogicLayer
{
    public class PaymentTypesManager
    {
        private DataAccess _dataAccess = new DataAccess();

        public PaymentType Read(int paymentTypeId)
        {
            PaymentType paymentType = new PaymentType();

            try
            {
                _dataAccess.SetQuery("select PaymentTypeName from PaymentTypes where PaymentTypeId = @PaymentTypeId");
                _dataAccess.SetParameter("@PaymentTypeId", paymentTypeId);
                _dataAccess.ExecuteRead();

                if (_dataAccess.Reader.Read())
                {
                    paymentType.Id = paymentTypeId;
                    paymentType.Name = (string)_dataAccess.Reader["PaymentTypeName"];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _dataAccess.CloseConnection();
            }

            return paymentType;
        }

        public int Add(PaymentType paymentType)
        {
            // hack : No es necesario para un MVP
            return -1;
        }

        public int GetId(PaymentType paymentType)
        {
            if (paymentType == null)
            {
                return 0;
            }

            int paymentTypeId = 0;

            try
            {
                _dataAccess.SetQuery("select PaymentTypeId from PaymentTypes where PaymentTypeName = @PaymentTypeName");
                _dataAccess.SetParameter("@PaymentTypeName", paymentType.Name);
                _dataAccess.ExecuteRead();

                if (_dataAccess.Reader.Read())
                {
                    paymentTypeId = (int)_dataAccess.Reader["PaymentTypeId"];
                }
            }
            catch (Exception ex)
            {
                throw ex;
            }
            finally
            {
                _dataAccess.CloseConnection();
            }

            return paymentTypeId;
        }
    }
}
