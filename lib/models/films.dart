class Films
{
  String _titulo;           //"title"
  String _imagemFundo;      //"backdrop_path"
  String _tituloOriginal;   //"original_title"
  String _resumo;           //"overview"
  String _poster;           //"poster_path"
  String _dataLancamento;  //"release_date"
  double _classificacao;    //"vote_average"

  String get titulo => _titulo;
  String get imagemFundo => _imagemFundo ;
  String get tituloOriginal => _tituloOriginal;
  String get resumo => _resumo;
  String get poster => _poster;
  String get dataLancamento => _dataLancamento;
  double get classificacao => _classificacao;

  set titulo(titulo) => {_titulo = titulo};
  set imagemFundo(imagemFundo) => {_imagemFundo = imagemFundo};
  set tituloOriginal(tituloOriginal) => {_tituloOriginal = tituloOriginal};
  set resumo(resumo) => {_resumo = resumo};
  set poster(poster) => {_poster = poster};
  set dataLancamento(dataLancamento) => {_dataLancamento = dataLancamento};
  set classificacao(classificacao) => {_classificacao = classificacao};

  Films({
    required String titulo,
    required String imagemFundo,
    required String tituloOriginal,
    required String resumo,
    required String poster,
    required String dataLancamento,
    required double classificacao,
  })  
  : _titulo = titulo,
    _imagemFundo = imagemFundo,
    _tituloOriginal = tituloOriginal,
    _resumo = resumo,
    _poster = poster,
    _dataLancamento = dataLancamento,
    _classificacao = classificacao;

  factory Films.fromJson(Map<String, dynamic> json) => Films(
    titulo: json["title"], 
    imagemFundo: json["backdrop_path"] ?? '', 
    tituloOriginal: json["original_title"], 
    resumo: json["overview"], 
    poster: json["poster_path"] ?? '', 
    dataLancamento: json["release_date"], 
    classificacao: json["vote_average"]
  );

  
}
