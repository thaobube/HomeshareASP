using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Entities
{
    public class PaysEntity
    {
        #region Fields
        private int _idPays;
        private string _libelle;
        #endregion

        #region Properties
        public int IdPays
        {
            get
            {
                return _idPays;
            }

            set
            {
                _idPays = value;
            }
        }

        public string Libelle
        {
            get
            {
                return _libelle;
            }

            set
            {
                _libelle = value;
            }
        } 
        #endregion
    }
}
