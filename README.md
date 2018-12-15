# presidentSpeech

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/presidentSpeech)](https://cran.r-project.org/package=presidentSpeech)
[![Coverage status](https://codecov.io/gh/forkonlp/presidentSpeech/branch/master/graph/badge.svg)](https://codecov.io/github/forkonlp/presidentSpeech?branch=master)
[![Travis-CI Build Status](https://travis-ci.org/forkonlp/presidentSpeech.svg?branch=master)](https://travis-ci.org/forkonlp/presidentSpeech)
[![AppVeyor build status](https://ci.appveyor.com/api/projects/status/github/forkonlp/presidentSpeech?branch=master&svg=true)](https://ci.appveyor.com/project/forkonlp/presidentSpeech)

## 3rd krdata project package!!!

<https://forkonlp.github.io/presidentSpeech/>

대통령 기록 연구실의 [연설기록][연설기록] 페이지에서 연설문을 가져옵니다.

## 설치 Installation

[GitHub](https://github.com/)에서 설치할 수 있습니다.

``` r
source("https://install-github.me/forkonlp/presidentSpeech")
```

## 설명문서 help

`?함수이름`이나 `help(함수이름)`을 사용하시면 함수의 설명을 볼 수 있습니다.

## 예제 Example

2개의 speech에 대한 함수와 3개의 검색 조건에 대한 함수로 이루어져 있습니다.

### speech 에 대한 함수

처음 함수는 speech를 검색하는 함수입니다. `library(presidentSpeech)`를 이용해 패키지를 로드해야 사용할 수 있습니다.

``` r
search_speech(count=20)
```

두 번째는 speech text를 가져오는 함수입니다.

``` r
get_speech("http://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1308580")
```

### 검색 조건에 대한 함수

`search_speech()` 함수의 인자 중에 president, field, event에서 사용할 조건을 출력해줍니다.

```r
# 대통령 리스트 출력
get_president()

# 분야 리스트 출력
get_field()

# 유형 리스트 출력
get_event()
```

[연설기록]: http://www.pa.go.kr/research/contents/speech/index.jsp
[같은문제]: https://ja.stackoverflow.com/questions/24083/rstudio%E3%81%A7%E3%81%AErmecab%E3%81%AE%E8%B5%B7%E5%8B%95%E6%99%82%E3%81%AE%E3%82%A8%E3%83%A9%E3%83%BC%E3%83%A1%E3%83%83%E3%82%BB%E3%83%BC%E3%82%B8
