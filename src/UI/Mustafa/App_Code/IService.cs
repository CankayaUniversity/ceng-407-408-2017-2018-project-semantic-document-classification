using System;
using System.Collections.Generic;
using System.Linq;
using System.Runtime.Serialization;
using System.ServiceModel;
using System.Text;

// NOTE: You can use the "Rename" command on the "Refactor" menu to change the interface name "IService" in both code and config file together.
[ServiceContract]
public interface IService
{
    [OperationContract]
    USER funcLoginCheck(string strEmail, string strPassword);

    [OperationContract]
    bool funcRegister(string strName, string strSurname, string City,string strPhone,string strEmail, string strAddress, string strPassword );

    [OperationContract]
    string HashPassword(string password);

    [OperationContract]
    bool VerifyPassword(string password, string savedPasswordHash);
}
