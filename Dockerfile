FROM macool/content-planner

# bundle content-planner
ADD . /var/www/content-planner
WORKDIR /var/www/content-planner
RUN bash -c "bundle install"

# prepend gem binaries to path so /usr/bin/env doesn't complain
RUN echo "export PATH=/.rbenv/versions/2.1.2/bin/:$PATH" >> /.bashrc

EXPOSE 3058
EXPOSE 1080

CMD ["/var/www/content-planner/startup.sh"]
