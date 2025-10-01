FROM domjudge/judgehost:8.3.1

RUN apt-get update && apt-get install -y wget unzip openjdk-17-jdk \
  && rm -rf /var/lib/apt/lists/*

RUN wget https://github.com/JetBrains/kotlin/releases/download/v2.2.20/kotlin-compiler-2.2.20.zip \
  && unzip kotlin-compiler-2.2.20.zip -d /usr/local/ \
  && rm kotlin-compiler-2.2.20.zip \
  && ln -s /usr/local/kotlinc/bin/kotlinc /usr/bin/kotlinc \
  && ln -s /usr/local/kotlinc/bin/kotlin /usr/bin/kotlin