using System;
using System.ComponentModel;
using System.Reflection;

namespace FlowersPlanet.Helpers
{
    public class LocalizedDisplayName : DisplayNameAttribute
    {
        private PropertyInfo _nameProperty;
        private Type _resourceType;
 
        public LocalizedDisplayName(string displayNameKey): base(displayNameKey)
        {
 
        }
 
        public Type NameResourceType
        {
            get
            {
                return _resourceType;
            }
            set
            {
                _resourceType = value;
                //������������� nameProperty, ����� ��� �������� ��������������� set'���
                _nameProperty = _resourceType.GetProperty(base.DisplayName, BindingFlags.Static | BindingFlags.Public);
            }
        }
 
        public override string DisplayName
        {
            get
            {
                //���������,nameProperty null � ���������� �������� �������� ������������� �����
                if (_nameProperty == null)
                {
                    return base.DisplayName;
                }
 
                return (string)_nameProperty.GetValue(_nameProperty.DeclaringType, null);
            }
        } 
    }
}