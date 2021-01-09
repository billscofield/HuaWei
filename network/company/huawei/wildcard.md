https://www.imedita.com/blog/wildcard-masks/

https://www.guru99.com/wildcard-mask-calculator.html#:~:text=A%20wildcard%20mask%20is%20a%20sequence%20of%20numbers,in%20the%20wildcard%20mask%2C%20the%20opposite%20is%20true.

https://blog.51cto.com/haolun/993194

## WCM (Wildcard Mask)

Wildcard mask bit 0 – Matches the corresponding bit value in the address.
Wildcard mask bit 1 – Ignores the corresponding bit value in the address.

If the wildcard mask bit 0, then it matches the bit value in the address.
If the wildcard mask bit 1, then you should ignore the corresponding bit value in the address.


0表示准确匹配，1表示忽略匹配项

一般情况下快速计算的方法是：255-子网掩码

The easiest method for calculating a wildcard mask is to subtract the network subnet mask from 255.255.255.255


快速计算通配符掩码在子网为连续的情况，但如果精确匹配不连续的子网时，不能用快速计算方法





---

## 不连续子网


例如，有六个网段：
    10.1.1 .0/24、
    10.1.2 .0/24
    10.1.3 .0/24
    10.1.16.0/24
    10.1.17.0/24
    10.1.18.0/24.

如何用反子网掩码实现匹配，我们把每个网段的第三位写成二进制

    0000 0001
    0000 0010
    0000 0011
    0001 0000
    0001 0001
    0001 0010

子网掩码为  11100000 = 224  
反子网掩码  00010011 = 19   

为什么这么写是因为前3位和中间2为都为0，我们可以进行精确匹配，通配符掩码写全了为：0.0.19.255, 此时255-224=31  并不等于19

通配符掩码用 XOR 异或，找不同
子网掩码用 AND, 找相同


---

### How to Calculate Advanced Wildcard Masks

https://www.imedita.com/blog/wildcard-masks/

by admin | Dec 6, 2017 | CCNA, CCNP | 1 comment

In this blog, we are going to go in depth to understand the real logic behind working of wildcard mask and how you can utilise it more effectively for your configuration. Wildcards masks are used at different places in Cisco IOS CLI and is a very important concept to understand from CCNA and CCNP certification point of view.

For beginners, the easiest method to figure out wildcard mask is still to subtract the subnet mask from 255.255.255.255. For instance, if the subnet mask is 255.255.255.128 the wildcard mask can be calculated as shown below:

255.255.255.255

–255.255.255.128 <——- Subnet Mask

————————————–

0.0.0.127 <——-Wildcard Mask

This method is more than sufficient for most of the CCNA level configuration tasks. Basically, wildcard mask is made up of 1’s and 0’s where

1   Represents the bit that we don’t care about
0   Represents the bit that we care about and should not get changed in IP Address that is matched to statement
Let’s take an example,

We are given a range of 1.2.3.0 – 1.2.3.255 and from this range, I have to match only IP coming in the range of 1.2.3.0 – 1.2.3.3. For that, we have to write down a combination of an IP address and Wildcard mask such that it matches only first 4 IP addresses from the complete range. This can be done as,

1.2.3.0 00000001 . 00000010 . 00000011 . 00000000   First IP Address in Binary
1.2.3.1 00000001 . 00000010 . 00000011 . 00000001   Second IP Address in Binary
1.2.3.2 00000001 . 00000010 . 00000011 . 00000010   Third IP Address in Binary
1.2.3.3 00000001 . 00000010 . 00000011 . 00000011   Fourth IP Address in Binary
Wildcard Mask   00000000 . 00000000 . 00000000 . 00000011   0.0.0.3 – WCM in Decimal
Network ID  00000001 . 00000010 . 00000011 . 000000XX   1.2.3.0 – IP Address in Decimal
As you can see, first 30 bits in all the IP address are exactly same and must be same if we want to match all these IP. So when writing down the IP that we are going to use along with wildcard mask, we don’t have to change the first 30 bits of IP. Write them down as it is. Also, remember that we don’t care about last two bits, so we can write down anything that we can write by changing last two bits only. Matching will be done on the behalf of first 30 bits only. And that’s what we have done there. In place of XX, you can write down whatever you want to use.

First 30 bits must match so while writing down wildcard mask, we have to write 30 zeros and remaining 2 bits don’t care. If you think about this, by not caring about last two bits, we can make only 4 numbers, 00, 01, 10, and 11. Which means 0, 1, 2, 3 in decimal and that’s exactly what we wanted to match.

In order to understand the calculation for wildcard mask for advanced use, we first need to understand two logic gates – AND Gate and XOR Gate.

AND – The output is 1 when both inputs are 1. In all other cases output is 0.

A AND B

A   B   Output
0   0   0
0   1   0
1   0   0
1   1   1

XOR- In Exclusive-OR gate the output is 1 when either of inputs A or B is 1, But not if both A and B are 1. Also, the output will be 0 if both are 0. In other words, we can say output will be 1 only when inputs are not same.

A XOR B

A   B   Output
0   0   0
0   1   1
1   0   1
1   1   0

Example:

Case 1 – “Permit” or “Deny” two different IP Address using one statement in ACL.

In order to find the best match for any specific address and wildcard combination that will match two address we use AND and XOR gates.

For instance, if we have two IP address 1.2.3.4 and 4.3.2.1 and we want to create an ACL that is the most specific match for these two addresses then we will have to use AND gate to figure out the address and XOR operation for finding wildcard mask. For ease of understanding, you can write the address in binary. Below mentioned table illustrates same:-

                        1.2.3.4    00000001 . 00000010 . 00000011 . 00000100
                        4.3.2.1    00000100 . 00000011 . 00000010 . 00000001
Wildcard Mask in Binary 00000101 . 00000001 . 00000001 . 00000101 
Network-ID in Binary    00000000 . 00000010 . 00000010 . 00000000

If you write the same two things in decimal then address becomes 0.2.2.0 and wildcard mask will be 5.1.1.5. So the access-list statement would be something like:

Access-list 10 permit 0.2.2.0 5.1.1.5

This can be utilized to figure out most specific wildcard for ACL in one statement for two different IP Addresses.

This example also illustrates main difference between wildcard mask and subnet mask. When you write a subnet mask you write continuous 1’s followed by continuous 0’s whereas in case of wildcard mask you can write 1’s and 0’s in the discontinuous order.


Case 2 – “Permit / Deny” Odd or Even IP address of a subnet in one statement.

Now, this use example might seem unrealistic and you may never use it but this example gives you further insight into how powerful wildcard mask can be compared to subnet mask. Here it goes, let’s say you have a full subnet in which you just want to permit IP Address whose fourth octet is the odd number. What I mean is that if the subnet is 192.0.0.0/24 then I want only IP Address of 192.0.0.1, 192.0.0.3, 192.0.0.5 and so on to be allowed for the certain thing. Now one easy way is to have lots of statements in ACL having individual entries for these IP Address. This same task can be accomplished in just one statement. For ease of understanding lets write some odd IP Address in binary:

192.0.0.1   11000000 . 0000000 . 00000000 . 00000001
192.0.0.3   11000000 . 0000000 . 00000000 . 00000011
192.0.0.5   11000000 . 0000000 . 00000000 . 00000101
192.0.0.7   11000000 . 0000000 . 00000000 . 00000111
AND Operation for IP Address    11000000 . 0000000 . 00000000 . 00000001
XOR Operation for Wildcard Mask 00000000 . 0000000 . 00000000 . 11111110

If you notice all the IP Addresses with the ODD number in their fourth octet have the last bit as 1. So if this bit is 1 then only IP address has an ODD number in their fourth octet. Relating to the previous statement, here, we only care about the last most bit of the fourth octet. So if we want to accomplish the task of permitting all IP Address with 4th octet as the ODD number then this last bit should remain as it is. We can use a wildcard mask such as it cares about only last most bit and doesn’t care about any other bit in the fourth octet. The statement can be written as:

Access-list 10 permit 192.0.0.1 0.0.0.254

Let’s do the same for even numbers. We have to use an AND operation for IP Address and XOR operation for wildcard mask. Try to understand it in following example,

192.0.0.0   11000000 . 0000000 . 00000000 . 00000000
192.0.0.2   11000000 . 0000000 . 00000000 . 00000010
192.0.0.4   11000000 . 0000000 . 00000000 . 00000100
192.0.0.6   11000000 . 0000000 . 00000000 . 00000110
AND Operation for IP Address    11000000 . 0000000 . 00000000 . 00000000
XOR Operation for Wildcard Mask 00000000 . 0000000 . 00000000 . 11111110
If you notice all the IP Addresses with the EVEN number in their fourth octet have the last bit as 0. So if this bit is 0 then only IP address has an EVEN number in their fourth octet. Here also, we only care about the last most bit of the fourth octet. So to match all IP Address with 4th octet as the EVEN number then this last bit should remain as it is. We can use a wildcard mask such as it cares about only last most bit and doesn’t care about any other bit in the fourth octet. The statement can be written as:

Access-list 10 deny 192.0.0.0 0.0.0.254

Above statement will deny any IP address in given range if it has an EVEN number in 4th octet.

And that is how we can use the wildcard mask for matching multiple IP address in more flexible way than the subnet mask. We couldn’t have done the matching of EVEN/ODD IP addresses with subnet mask as subnet mask is continuous ones, following zeros. While a wildcard mask is not bounded by any such rule.





### 总结

AND gate to figure out the address 
XOR operation for finding wildcard mask

What if you want to include both 10.0.0.0/24 and 10.0.1.0/24 subnets?

    10.0.0. 0 = 00001010.00000000.00000000.00000000
    10.0.1. 0 = 00001010.00000000.00000001.00000000
    AND       = 00001010.00000000.00000000.00000000
    子网掩码  = 11111111.11111111.11111111.00000000
    0.0.1.255 = 00000000.00000000.00000001.11111111  // 通配符 wildcard 需要考虑子网掩码，子网掩码主机位



    1. 明确给出了子网
        网络位全部 XOR 运算
        主机位全部 先写 1，即先全部认为可通配, 

        主机位相同的位改写为1，即这些位可以通配

    1. 没有给出子网


    10.0.0. 1 = 00001010.00000000.00000000.00000001
    10.0.1. 0 = 00001010.00000000.00000001.00000000
    子网掩码  = 11111111.11111111.11111111.00000000
    0.0.1.255 = 00000000.00000000.00000001.11111110  // 通配符 wildcard 需要考虑子网掩码，子网掩码主机位


    XOR 为 0 需要精确匹配的位, 
    XOR 为 1, 即通配符的位置



    192.0.0.0   11000000 . 0000000 . 00000000 . 00000000
    192.0.0.2   11000000 . 0000000 . 00000000 . 00000010
    192.0.0.4   11000000 . 0000000 . 00000000 . 00000100
    192.0.0.6   11000000 . 0000000 . 00000000 . 00000110

    XOR         00000000 . 0000000 . 00000000 . 00000110
    NET         11111111 . 1111111 . 11111111 . 11111000

