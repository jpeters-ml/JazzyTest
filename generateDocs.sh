#! /bin/bash

if [[ "$#" -ne 1 ]]
then
   echo "Please supply what to document: all, app, unit, or ui"
   exit 1
fi

if [ $1 != "all" ] && [ $1 != "app" ] && [ $1 != "unit" ] && [ $1 != "ui" ]
then
   echo "Invalid argument. Use all, app, unit, or ui"
   exit 1
fi

cd JazzyTest

if [ $1 == "all" ] || [ $1 == "app" ]
then
   jazzy \
      --author "Micro-Leads Inc" \
      --author_url https://www.micro-leads.com/ \
      --github_url https://www.github.com/ \
      --min-acl public \
      --build-tool-arguments -workspace,JazzyTest.xcworkspace,-scheme,JazzyTest,-destination='platform=ios simulator,name=iPad (9th generation)' \
      --modules JazzyTest \
   if [ $? -ne 0 ]
   then
      exit $?
   fi
fi

if [ $1 == "all" ] || [ $1 == "unit" ]
then
    jazzy \
    --author "Micro-Leads Inc" \
    --author_url https://www.micro-leads.com/ \
    --github_url https://www.github.com/ \
    --min-acl private \
    --build-tool-arguments -workspace,JazzyTest.xcworkspace,-scheme,JazzyTest,-destination='platform=ios simulator,name=iPad (9th generation)' \
    --module JazzyTestTests \
    --output docTests
   if [ $? -ne 0 ]
   then
      exit $?
   fi
fi

if [ $1 == "all" ] || [ $1 == "ui" ]
then
    jazzy \
    --author "Micro-Leads Inc" \
    --author_url https://www.micro-leads.com/ \
    --github_url https://www.github.com/ \
    --min-acl private \
    --build-tool-arguments -workspace,JazzyTest.xcworkspace,-scheme,JazzyTest,-destination='platform=ios simulator,name=iPad (9th generation)' \
    --module JazzyTestUITests \
    --output docUITests
   if [ $? -ne 0 ]
   then
      exit $?
   fi
fi

