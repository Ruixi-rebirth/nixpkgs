{ lib
, buildPythonPackage
, fetchpatch
, fetchPypi
, pytestCheckHook
, python-dateutil
, pythonAtLeast
, pythonOlder
}:

buildPythonPackage rec {
  pname = "freezegun";
  version = "1.2.2";
  format = "setuptools";

  disabled = pythonOlder "3.6";

  src = fetchPypi {
    inherit pname version;
    hash = "sha256-zSLRugaUE4RBDNln2KmdWuJEL1ffr+/y/aXejcXAVEY=";
  };

  patches = lib.optionals (pythonAtLeast "3.10") [
    # Staticmethods in 3.10+ are now callable, prevent freezegun to attempt to decorate them
    (fetchpatch {
      url = "https://github.com/spulec/freezegun/pull/397/commits/e63874ce75a74a1159390914045fe8e7955b24c4.patch";
      hash = "sha256-FNABqVN5DFqVUR88lYzwbfsZj3xcB9/MvQtm+I2VjnI=";
    })
  ];

  propagatedBuildInputs = [
    python-dateutil
  ];

  nativeCheckInputs = [
    pytestCheckHook
  ];

  pythonImportsCheck = [
    "freezegun"
  ];

  meta = with lib; {
    description = "Library that allows your Python tests to travel through time";
    homepage = "https://github.com/spulec/freezegun";
    license = licenses.asl20;
    maintainers = with maintainers; [ fab ];
  };
}
