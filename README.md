# komment

[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![CRAN status](https://www.r-pkg.org/badges/version/komment)](https://cran.r-project.org/package=komment)
[![R-CMD-check](https://github.com/forkonlp/komment/workflows/R-CMD-check/badge.svg)](https://github.com/forkonlp/komment/actions)
[![Codecov test coverage](https://codecov.io/gh/forkonlp/komment/branch/main/graph/badge.svg)](https://codecov.io/gh/forkonlp/komment?branch=main)

## 3rd krdata project package!!!

<https://forkonlp.github.io/komment/index.html>

대통령 기록 연구실의 [연설기록][연설기록] 페이지에서 연설문을 가져옵니다.

## 설치 Installation

[GitHub](https://github.com/)에서 설치할 수 있습니다.

``` r
install.packages('komment', repos = 'https://forkonlp.r-universe.dev')
```

## 설명문서 help

`?함수이름`이나 `help(함수이름)`을 사용하시면 함수의 설명을 볼 수 있습니다.

## 예제 Example

2개의 speech에 대한 함수와 3개의 검색 조건에 대한 함수로 이루어져 있습니다.

### speech 에 대한 함수

처음 함수는 speech를 검색하는 함수입니다. `library(komment)`를 이용해 패키지를 로드해야 사용할 수 있습니다.

``` r
search_speech(count=20)
```

두 번째는 speech text를 가져오는 함수입니다.

``` r
get_speech("https://www.pa.go.kr/research/contents/speech/index.jsp?spMode=view&catid=c_pa02062&artid=1308580")
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

[연설기록]: https://www.pa.go.kr/research/contents/speech/index.jsp
