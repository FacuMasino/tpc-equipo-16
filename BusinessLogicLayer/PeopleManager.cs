﻿using System;
using System.Data;
using DataAccessLayer;
using DomainModelLayer;

namespace BusinessLogicLayer
{
    public class PeopleManager
    {
        private DataAccess _dataAccess = new DataAccess();
        private AddressesManager _addressesManager = new AddressesManager();

        public Person Read(int personId)
        {
            Person person = new Person();

            try
            {
                _dataAccess.SetProcedure("SP_Read_Person");
                _dataAccess.SetParameter("@RoleId", personId);
                _dataAccess.ExecuteRead();

                if (_dataAccess.Reader.Read())
                {
                    person.PersonId = personId;
                    person.IsActive = (bool)_dataAccess.Reader["IsActive"];
                    person.FirstName = _dataAccess.Reader["FirstName"]?.ToString();
                    person.FirstName = person.FirstName ?? "";
                    person.LastName = _dataAccess.Reader["LastName"]?.ToString();
                    person.LastName = person.LastName ?? "";
                    person.TaxCode = _dataAccess.Reader["TaxCode"]?.ToString();
                    person.TaxCode = person.TaxCode ?? "";
                    person.Phone = _dataAccess.Reader["Phone"]?.ToString();
                    person.Phone = person.Phone ?? "";
                    person.Email = _dataAccess.Reader["Email"]?.ToString();
                    person.Email = person.Email ?? "";
                    person.Birth = (DateTime)_dataAccess.Reader["Birth"];
                    person.Address.Id = (int)_dataAccess.Reader["AddressId"];
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

            person.Address = _addressesManager.Read(person.Address.Id);

            return person;
        }
    }
}
