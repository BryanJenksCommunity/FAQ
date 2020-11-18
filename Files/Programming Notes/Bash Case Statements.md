Tags: 
References: 
Links: [[Bash|Bash]]

---

# Bash Case Statements

Case statement syntax in bash is a little strange but also really easy and they are very friendly and nice.

case will look for a value in a list of options, each option is appended with a paren then the commands that this option will run. these options can also expand with wild cards. To have a final catch all statement for anything that didnt meet a prior condition use `*` as the final case option.

```bash
case "$RESPONSE" in
    n) exit ;;
    N) exit ;;
    q) exit ;;
    Q) exit ;;
    y) mkdir $DIR && touch $TEMPLATE_DECK && echo "category1:question1:answer1" >> $TEMPLATE_DECK && echo "category2:question2:answer2" >> $TEMPLATE_DECK && echo "category3:question3:answer3" >> $TEMPLATE_DECK && echo "$DIR_MADE_MSG" ;;
    Y) mkdir $DIR && touch $TEMPLATE_DECK && echo "category1:question1:answer1" >> $TEMPLATE_DECK && echo "category2:question2:answer2" >> $TEMPLATE_DECK && echo "category3:question3:answer3" >> $TEMPLATE_DECK && echo "$DIR_MADE_MSG" ;;
    *) echo "invalid choice, please select either 'y' or 'n'" ;;
esac
```
