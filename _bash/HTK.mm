<map version="0.7.1">
<node COLOR="#000000" TEXT="HTK">
<edge COLOR="#330099" STYLE="sharp_linear"/>
<cloud/>
<node TEXT="2wav" FOLDED="true" POSITION="right">
<node TEXT="executar o script &#xa8;dat2lsw.sh&#xa8; "/>
<node TEXT="Com o praat fazer a convers&#xe3;o de &#xa8;alaw&#xa8; para &#xa8;wav&#xa8;."/>
</node>
<node TEXT="DATA PREPARATION" FOLDED="true" POSITION="right">
<node COLOR="#000000" TEXT="Criar gramatica" FOLDED="true">
<node TEXT="digitado"/>
</node>
<node TEXT="HParse">
<icon BUILTIN="penguin"/>
<node TEXT="HParse gram wdnet">
<icon BUILTIN="penguin"/>
</node>
</node>
<node TEXT="Criar dicionario" FOLDED="true">
<node TEXT="digitado"/>
</node>
<node TEXT="HSGen">
<icon BUILTIN="penguin"/>
<node TEXT="HSGen -l -n NUMERO wdnet dict &gt; testpromts ">
<icon BUILTIN="penguin"/>
</node>
</node>
<node TEXT="prompts2mlf">
<icon BUILTIN="penguin"/>
<node TEXT="/home/fernando/profala/devel/tools/htk/samples/HTKTutorial/prompts2mlf words.mlf testpromts  ">
<icon BUILTIN="penguin"/>
</node>
<node TEXT="Foi preciso retirar um ponto &#xa;dos arquivos gerados pelo HSGen."/>
</node>
<node TEXT="Criar mkphones0.led" FOLDED="true">
<node TEXT="pag.28 do tutorial.">
<icon BUILTIN="attach"/>
</node>
</node>
<node TEXT="HLEd">
<icon BUILTIN="penguin"/>
<node TEXT="HLEd -l &#xb4;*&#xb4;-d dict -i phones0.mlf mkphones0.led words.mlf">
<icon BUILTIN="penguin"/>
</node>
</node>
<node TEXT="Ciriar configuration file ( config )" FOLDED="true">
<node TEXT="pag. 29 do tutorial">
<icon BUILTIN="attach"/>
</node>
<node TEXT="falta um par&#xe2;metro na linha 4:&#xa;SOURCEFORMAT = WAV"/>
</node>
<node TEXT="HCopy">
<icon BUILTIN="penguin"/>
<node TEXT="Gerar arquivos .mfc"/>
<node TEXT="ou mfcc com _Z no configWAV2MFCC file"/>
<node TEXT="HCopy -T 1 -C configWAV2MFCC -S codetr.scp">
<icon BUILTIN="penguin"/>
</node>
</node>
</node>
<node TEXT="CREATING HMMs" FOLDED="true" POSITION="right">
<node TEXT="Criar o proto file" FOLDED="true">
<node TEXT="digitado"/>
</node>
<node TEXT="Criar o diret&#xf3;rio hmm0"/>
<node TEXT="HCompV">
<icon BUILTIN="penguin"/>
<node TEXT="HCompV -C configWAV2MFCC -f 0.01 -m -S train.scp -M hmm0 proto">
<icon BUILTIN="penguin"/>
</node>
</node>
<node TEXT="Criar o &#xa8;hmmdefs&#xa8; e o &#xa8;macros&#xa8;  ">
<node TEXT="hmmdefs">
<node TEXT="um modelo para cada fone utilizado para o &#xa;modelo do sil&#xea;ncio s&#xf3; &#xe9; preciso de 5 estados.">
<icon BUILTIN="messagebox_warning"/>
</node>
</node>
<node TEXT="macros">
<node TEXT="a linha:  ~o &lt;MFCC_0_D_A&gt; &lt;VecSize&gt; 39  &#xa;mais o que existe no arquivo vFloors"/>
</node>
</node>
<node TEXT="Criar o monophones0">
<node TEXT="N&#xe3;o est&#xe3;o sendo utilizados monophones &#xa;nesta aplica&#xe7;&#xe3;o e sim a pr&#xf3;pias palavras."/>
<node TEXT="Uma coisa &#xe9; boa lembrar se for usar letras &#xa;mai&#xfa;sculas sempre use MAIS&#xda;SCULAS!!!"/>
</node>
<node TEXT="Pode inserir uma nova &#xa;transicao em alguma palavra." FOLDED="true">
<node TEXT="HHEd" FOLDED="true">
<icon BUILTIN="penguin"/>
<node TEXT="HHEd -H hmm0/macros -H hmm0/hmmdefs -M hmm1 um.hed monophones0">
<icon BUILTIN="penguin"/>
</node>
</node>
</node>
<node TEXT="HERest">
<icon BUILTIN="penguin"/>
<node TEXT="HERest -C configWAV2MFCC  -I phones0.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmm0/macros -H hmm0/hmmdefs -M hmm1 monophones0">
<icon BUILTIN="penguin"/>
</node>
<node TEXT="Pode-se utilizar HERest para restimar v&#xe1;rias vezes, foi feito at&#xe9; hmm3."/>
</node>
<node TEXT="Criar no diret&#xf3;rio hmm4 os arquivos &#xa8;macros&#xa8; e &#xa8;hmmdefs&#xa8; copiados &#xa;de hmm3, e inserir o &#xa8;sp&#xa8; em hmmdefs com o estado 3 do sil&#xea;ncio."/>
<node TEXT="Criar o arquivo monophones1, que  contem o fone &#xa8;sp&#xa8;."/>
<node TEXT="Criar  arquivo phones1.mlf, com o &#xa8;sp&#xa8;." FOLDED="true">
<node TEXT="Para gera-lo &#xe9; necess&#xe1;rio modificar o arquivo &#xa8;mkphones0.led&#xa8; &#xa;excluindo a linha que tem o comando &#xa8;DE sp&#xa8;. A partir da&#xed; &#xe9; &#xa;poss&#xed;vel com o HLEd gerar o &#xa8;phones1.mlf&#xa8;.&#xa;"/>
</node>
<node TEXT="Criar o arquivo sil.hed" FOLDED="true">
<node TEXT="pag.33 do tutorial.">
<icon BUILTIN="attach"/>
</node>
</node>
<node TEXT="HHEd" FOLDED="true">
<icon BUILTIN="penguin"/>
<node TEXT="HHEd -H hmm4/macros -H hmm4/hmmdefs -M hmm5 sil.hed monophones1">
<icon BUILTIN="penguin"/>
</node>
</node>
<node TEXT="Fazer mais duas aplica&#xe7;&#xf5;es do HERest sobre os novos dados."/>
<node TEXT="HERest" FOLDED="true">
<icon BUILTIN="penguin"/>
<node TEXT="HERest -C configWAV2MFCC  -I phones1.mlf -t 250.0 150.0 1000.0 -S train.scp -H hmmX/macros -H hmmX/hmmdefs -M hmm(X+1) monophones1">
<icon BUILTIN="penguin"/>
</node>
<node TEXT="Pode-se utilizar HERest para restimar v&#xe1;rias vezes, foi feito at&#xe9; hmm7."/>
</node>
</node>
<node TEXT="RECOGNISER EVALUATION" FOLDED="true" POSITION="right">
<node TEXT="HVite">
<icon BUILTIN="penguin"/>
<node TEXT="HVite -H hmm8/macros -H hmm8/hmmdefs -S teste.scp -l &apos;*&apos; -i recout.mlf -w wdnet -p 0.0 -s 5.0 dict monophones1">
<icon BUILTIN="penguin"/>
</node>
<node TEXT="tiedlist SIMILAR A monophones1"/>
</node>
<node TEXT="HResults">
<icon BUILTIN="penguin"/>
<node TEXT="HResults -t -I wordsTeste.mlf monophones1 recout.mlf">
<icon BUILTIN="penguin"/>
</node>
</node>
</node>
<node TEXT="7828" FOLDED="true" POSITION="left">
<icon BUILTIN="kaddressbook"/>
<node TEXT="Gravar no telefone arquivos de voz"/>
</node>
</node>
</map>
