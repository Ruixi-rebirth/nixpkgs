{ lib
, buildPythonPackage
, fetchPypi
, msrest
, msrestazure
, azure-common
, azure-mgmt-core
, pythonOlder
}:

buildPythonPackage rec {
  pname = "azure-mgmt-recoveryservicesbackup";
  version = "5.1.0";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    extension = "zip";
    hash = "sha256-xl+KbNGceJWFvJKH8Aw02Ho+wMAxvxPZ4T09Qimn7OU=";
  };

  propagatedBuildInputs = [
    msrest
    msrestazure
    azure-common
    azure-mgmt-core
  ];

  # Module has no tests
  doCheck = false;

  pythonImportsCheck = [
    "azure.mgmt.recoveryservicesbackup"
  ];

  meta = with lib; {
    description = "This is the Microsoft Azure Recovery Services Backup Management Client Library";
    homepage = "https://github.com/Azure/azure-sdk-for-python";
    license = licenses.mit;
    maintainers = with maintainers; [ maxwilson ];
  };
}
