%% multiclass naive Bayes model
Md4= fitcnb(data_real,output','Distribution', 'kernel');
label4_1 = predict(Md4,data_test1);
label4_2 = predict(Md4,data_test2);
label4_3 = predict(Md4,data_test3);
label4_4 = predict(Md4,data_test4);
Accuracy4_1=mean(output'==label4_1)*100;
Accuracy4_2=mean(output'==label4_2)*100;
Accuracy4_3=mean(output'==label4_3)*100;
Accuracy4_4=mean(output'==label4_4)*100;
Accuracy4=(90*Accuracy4_1+6*Accuracy4_2+3*Accuracy4_3+Accuracy4_4)/100;
EVAL4_1 = Evaluate(output',label4_1);
EVAL4_2 = Evaluate(output',label4_2);
EVAL4_3 = Evaluate(output',label4_3);
EVAL4_4 = Evaluate(output',label4_4);
EVAL4=[90.*EVAL4_1;6.*EVAL4_2;3.*EVAL4_3;EVAL4_4];
MeanEval4=mean(EVAL4)/24.5
