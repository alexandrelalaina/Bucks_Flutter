String formatarIdDescr ( String pId, String pDescr ) {
  String _retorno;

  if (pId != null)
    _retorno = pId + ') ';

  _retorno = _retorno + pDescr;

  return _retorno;
}