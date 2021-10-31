## chage 

change **user password** expiry information

- -d, --lastday

    Set the number of days since January 1st, 1970 when the password was last
    changed. The date may also be expressed in the format YYYY-MM-DD (or the
    format more commonly used in your area)

- -E, --expiredate
    
    Set the date or number of days since January 1, 1970 on which the user's
    account will no longer be accessible. The date may also be expressed in the
    format YYYY-MM-DD.

    Passing the number -1 as the EXPIRE_DATE will remove an account expiration
    date.


-m, --mindays
    Set the minium number of days during which a password is valid.

-M, --maxdays
    Set the maximum number of days during which a password is valid.

    When MAX_DAYS plus LAST_DAY is less than the current day, the user will be
    required to change his/her password before being able to use his/her
    account.

