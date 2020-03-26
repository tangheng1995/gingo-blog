FROM node
LABEL maintainer="Archer <347420070@qq.com>"
RUN apt-get install git -y && git clone -b gingo-blog https://github.com/tangheng1995/gingo-blog.git  
WORKDIR /gin-blog
RUN npm install && npm install hexo -g
EXPOSE 4000
CMD hexo serve