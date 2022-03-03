%data_oraganisation.m;
%% knn
for k=1:20
Md1 = fitcknn(data_real,output','NumNeighbors',k);
label1_1 = predict(Md1,data_test1);
label1_2 = predict(Md1,data_test2);
label1_3 = predict(Md1,data_test3);
label1_4 = predict(Md1,data_test4);
%label1_5 = predict(Md1,data_test5);

Accuracy1_1=mean(output'==label1_1)*100;
Accuracy1_2=mean(output'==label1_2)*100;
Accuracy1_3=mean(output'==label1_3)*100;
Accuracy1_4=mean(output'==label1_4)*100;
%Accuracy1_5=mean(output'==label1_5)*100;

Accuracy1(k)=((75.94)*Accuracy1_1+6*Accuracy1_2+3*Accuracy1_3+Accuracy1_4)/100;
end
k=1:20;
[Mmax,index]=max(Accuracy1);
figure,
hold on
plot(k,Accuracy1,'DisplayName','Accuracy')
plot(index, Mmax,'*','DisplayName',['Optimal k= ', num2str(index)]);
hold off
xlabel('\fontsize{14}k');
ylabel('\fontsize{14}Accuracy');
legend('show')
grid
EVAL1_1 = Evaluate(output',label1_1);
EVAL1_2 = Evaluate(output',label1_2);
EVAL1_3 = Evaluate(output',label1_3);
EVAL1_4 = Evaluate(output',label1_4);
EVAL1=[90.*EVAL1_1;6.*EVAL1_2;3.*EVAL1_3;EVAL1_4];
MeanEval1=mean(EVAL1)/4.2