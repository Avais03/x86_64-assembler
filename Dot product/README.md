# Dot Product

<h3>Implementation of function in x86_64 Assembler language which computes the scalar product of vectors A and B.</h3>
<h4>Used vector AVX instructions to minimize the number of calculations.</h4>

+ It is guaranteed that `N > 0`, but it is not guaranteed that `N = 8k`, where `k` is natural number.
+ The values of the source vectors are stored in arbitrary memory addresses, so **alignment is not guaranteed for them**.
+ function signature `extern float dot_product(size_t N, const float *A, const float *B);`
+ to better understand I put commentary rear every line 

To explain how it works, I have attached an example `main.c`

<h3>Simplest use</h3>
**Simplest version of compile on x86_64 arch of cpu (on ARM use cross-compilation):**
```
gcc main.c dp.S -o test.exe
```

**Execute:**
```
./test.exe
```

**Output of my example should be:**
```
138
```

<h2>author: Vladimir Slastin🤙</h2>

+ [VK](https://vk.com/vovchik1902)
+ [Telegramm](https://www.t.me/SlastinVA)
+ [Instagram](https://www.instagram.com/dreaminngman)
<li itemprop="email" aria-label="Email: Avais03@mail.ru" class="vcard-detail pt-1 css-truncate css-truncate-target "><svg class="octicon octicon-mail" viewBox="0 0 16 16" version="1.1" width="16" height="16" aria-hidden="true"><path fill-rule="evenodd" d="M1.75 2A1.75 1.75 0 000 3.75v.736a.75.75 0 000 .027v7.737C0 13.216.784 14 1.75 14h12.5A1.75 1.75 0 0016 12.25v-8.5A1.75 1.75 0 0014.25 2H1.75zM14.5 4.07v-.32a.25.25 0 00-.25-.25H1.75a.25.25 0 00-.25.25v.32L8 7.88l6.5-3.81zm-13 1.74v6.441c0 .138.112.25.25.25h12.5a.25.25 0 00.25-.25V5.809L8.38 9.397a.75.75 0 01-.76 0L1.5 5.809z"></path></svg>
          <a class="u-email Link--primary " href="mailto:Avais03@mail.ru">Avais03@mail.ru</a>
</li>