class Formatters {
  String formatarData(String data)
  {
    final RegExp regex = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
    final Match? match = regex.firstMatch(data);
    if(match != null)
    {
      final String dia = match.group(3)!;
      final String mes = match.group(2)!;
      final String ano = match.group(1)!;

      return '$dia/$mes/$ano';      
    }
    else
    {
      return data;
    }
  }

  String formatarAno(String data)
  {
    final RegExp regex = RegExp(r'(\d{4})-(\d{2})-(\d{2})');
    final Match? match = regex.firstMatch(data);
    if(match != null)
    {
      final String ano = match.group(1)!;
      return ano;      
    }
    else
    {
      return data;
    }
  }
}