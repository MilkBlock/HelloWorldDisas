#set page(width: 8.5in, height: 11in, margin: 0.4in)
#align(center, text(17pt)[
  *Disassemble On Riscv64
  *
])
#align(center, text(12pt)[
  *2025/3/3 v1.0
  *
])
= wsl
由于很多同学没有linux环境，因此我们会使用wsl来运行linux程序。 
这个可以直接从微软商店下载配置wsl。

= Demo hello
+ 通过 vim 这个文本编辑器 写一个最基础的hello world 程序 \
 `vim hello.c`
+ 然后 通过gcc 去编译这个文件，并运行程序。

= 架构 architecture 
这是常见架构
+ x86 32/64   耗电
+ arm 手机  省电
+ apple   苹果手机
+ riscv 架构，常见于耳机
== 模拟器
由于我们会有在不同平台运行，因此我们会使用qemu 在x86平台运行riscv64的可执行文件。 \
#image("./qemu-static.png")


== 动态链接和静态链接
在linux 出现的时代，内存和硬盘都十分滴珍贵，于是我们会采用动态链接的方式，即在运行时，通过动态链接库的方式，将程序运行所需要的库文件加载到内存中，从而避免重复加载。
当然，我们需要引入一套交流机制，即ldso，通过这个程序我们可以在运行时动态加载库文件。

= 机器码 和 汇编 
gcc 默认得到的是机器码  ，当然你也可以通过 -S 直接得到汇编代码  \
`gcc hello.c -o hello -S`

== riscv 汇编
== gnu 常用工具链
#image("./riscv_gnu_toolchain.png")

== gdb 反汇编
反汇编就是把机器码转换成汇编代码的过程，在这里我们使用 multiarch-gdb 来进行运行时调试和反汇编。
`multiarch-gdb hello` \
#image("./multiarch-gdb.png",width: 50%)



