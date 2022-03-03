%% RF
for num_trees=1:30
Md2 = TreeBagger(num_trees,data_real,output');
label2_1 = str2num(cell2mat(predict(Md2,data_test1)));
label2_2 = str2num(cell2mat(predict(Md2,data_test2)));
label2_3 = str2num(cell2mat(predict(Md2,data_test3)));
label2_4 = str2num(cell2mat(predict(Md2,data_test4)));
label2=[label2_1 label2_2 label2_3 label2_4];
Output=[output;output;output;output];
Accuracy2_1=mean(output'==label2_1)*100;
Accuracy2_2=mean(output'==label2_2)*100;
Accuracy2_3=mean(output'==label2_3)*100;
Accuracy2_4=mean(output'==label2_4)*100;
Accuracy2(num_trees)=((70.91)*Accuracy2_1+6*Accuracy2_2+3*Accuracy2_3+Accuracy2_4)/100;
end

[Mmax,index]=max(Accuracy2);
num_trees=1:30;
figure,
hold on
plot(num_trees,Accuracy2,'DisplayName','Accuracy')
plot(index, Mmax,'o','DisplayName',['Optimal T= ', num2str(index)]);
hold off
xlabel('\fontsize{14}Trees number');
ylabel('\fontsize{14}Accuracy');
legend('show')
grid
EVAL2_1 = Evaluate(output',label2_1);
EVAL2_2 = Evaluate(output',label2_2);
EVAL2_3 = Evaluate(output',label2_3);
EVAL2_4 = Evaluate(output',label2_4);
EVAL2=[90.*EVAL2_1;6.*EVAL2_2;3.*EVAL2_3;EVAL2_4];
MeanEval2=mean(EVAL2)/23
