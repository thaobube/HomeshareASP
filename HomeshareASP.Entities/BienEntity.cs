using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace HomeshareASP.Entities
{
    public class BienEntity
    {
        #region Fields
        private int _idBien;
        private string _titre;
        private string _descCourte;
        private string _descLong;
        private int _nombrePerson;
        private string _ville;
        private string _rue;
        private string _numero;
        private string _codePostal;
        private string _photo;
        private int _pays;
        private bool _isEnable;
        #endregion

        #region Props
        public int IdBien
        {
            get
            {
                return _idBien;
            }

            set
            {
                _idBien = value;
            }
        }

        public string Titre
        {
            get
            {
                return _titre;
            }

            set
            {
                _titre = value;
            }
        }

        public string DescCourte
        {
            get
            {
                return _descCourte;
            }

            set
            {
                _descCourte = value;
            }
        }

        public int NombrePerson
        {
            get
            {
                return _nombrePerson;
            }

            set
            {
                _nombrePerson = value;
            }
        }

        public string Ville
        {
            get
            {
                return _ville;
            }

            set
            {
                _ville = value;
            }
        }

        public string Rue
        {
            get
            {
                return _rue;
            }

            set
            {
                _rue = value;
            }
        }

        public string Numero
        {
            get
            {
                return _numero;
            }

            set
            {
                _numero = value;
            }
        }

        public string CodePostal
        {
            get
            {
                return _codePostal;
            }

            set
            {
                _codePostal = value;
            }
        }

        public string Photo
        {
            get
            {
                return _photo;
            }

            set
            {
                _photo = value;
            }
        }

        public string DescLong
        {
            get
            {
                return _descLong;
            }

            set
            {
                _descLong = value;
            }
        }

        public int Pays
        {
            get
            {
                return _pays;
            }

            set
            {
                _pays = value;
            }
        }

        public bool IsEnable
        {
            get
            {
                return _isEnable;
            }

            set
            {
                _isEnable = value;
            }
        }

        #endregion
    }
}
