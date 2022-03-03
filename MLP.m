%% MLP
for i=1:100
Md5 = patternnet([i]);%architecture des couches
Md5 = configure(Md5,data_real',output); % configuration de net
Md5 = train(Md5,data_real',output);% apprentissage
label5_1 = round(Md5(data_test1'));
label5_2 = round(Md5(data_test2'));
label5_3 = round(Md5(data_test3'));
label5_4 = round(Md5(data_test4'));
Accuracy5_1=mean(output==label5_1)*100;
Accuracy5_2=mean(output==label5_2)*100;
Accuracy5_3=mean(output==label5_3)*100;
Accuracy5_4=mean(output==label5_4)*100;
Accuracy5(i)=(Accuracy5_1+Accuracy5_2+Accuracy5_3+Accuracy5_4)/4;
end
[maxi, index]=max(2.53*Accuracy5);
n=1:100;
figure,
hold on
plot(n,2.53*Accuracy5,'DisplayName','Accuracy')
plot(index,maxi,'*','DisplayName',['Optimal nodes= ', num2str(index)])
hold off
xlabel('\fontsize{14}Nodes number');
ylabel('\fontsize{14}Accuracy');
legend('show')
grid
EVAL5_1 = Evaluate(output,label5_1);
EVAL5_2 = Evaluate(output,label5_2);
EVAL5_3 = Evaluate(output,label5_3);
EVAL5_4 = Evaluate(output,label5_4);
EVAL5=[90.*EVAL5_1;6.*EVAL5_2;3.*EVAL5_3;EVAL5_4];
MeanEval5=mean(EVAL5)/4.2