Report 50310 "Company Payroll Summary 3"
{

    DefaultLayout = RDLC;
    Caption = 'Monthly PY20 Report';
    RDLCLayout = './Layouts/CompanyPayrollSummary3.rdlc';

    dataset
    {
        dataitem("prPayroll Periods"; "pr Payroll Periods")
        {
            column(ReportForNavId_1; 1)
            {
            }
            column(PrintDate; PrintDate) { }
            column(GeneratedBy; GeneratedBy) { }
            column(NumberOfStaff; NumberOfStaff)
            {
            }
            column(JudicialOfficer; JudicialOfficer)
            {
            }
            column(JudicialStaff; JudicialStaff)
            {
            }
            column(Casuals; Casuals)
            {
            }
            column(Judges; Judges)
            {
            }
            column(Secondary; Secondary)
            {
            }
            column(COMPANYNAME; COMPANYNAME)
            {
            }
            column(COMPANYNAME_Control1102755015; COMPANYNAME)
            {
            }
            column(COMPANYNAME_Control1102756027; COMPANYNAME)
            {
            }
            column(COMPANYNAME_Control1102756028; COMPANYNAME)
            {
            }
            column(CompanyInfo_Name;CompanyInfo.Name)
            {
            }
            column(CompanyInfo_Picture; CompanyInfo.Picture)
            {
            }
            column(CompanyInfo_Picture_Control1102756014; CompanyInfo.Picture)
            {
            }
            column(PayrollSummary; 'COMPANY PAYROLL SUMMARY')
            {
            }
            column(PeriodNamez; 'PERIOD:  ' + PeriodName)
            {
            }
            column(TransDesc; 'TRANSACTION DESC.')
            {
            }
            column(payments; 'PAYMENTS')
            {
            }
            column(deductions; 'DEDUCTIONS')
            {
            }
            column(kirinyagatitle; COMPANYNAME)
            {
            }
            column(abreviation; 'MMU')
            {
            }
            column(DetDate; DetDate)
            {
            }
            column(GPY; GPY)
            {
            }
            column(NETS; NETS)
            {
            }
            column(HLEVY; HLEVY)
            {
            }
            column(STAT; STAT)
            {
            }
            column(DED; DED)
            {
            }
            column(countz; countz)
            {
            }
            column(payTrans_1; PayTrans[1])
            {
            }
            column(payTrans_2; PayTrans[2])
            {
            }
            column(payTrans_3; PayTrans[3])
            {
            }
            column(payTrans_4; PayTrans[4])
            {
            }
            column(payTrans_5; PayTrans[5])
            {
            }
            column(payTrans_6; PayTrans[6])
            {
            }
            column(payTrans_7; PayTrans[7])
            {
            }
            column(payTrans_8; PayTrans[8])
            {
            }
            column(payTrans_9; PayTrans[9])
            {
            }
            column(payTrans_10; PayTrans[10])
            {
            }
            column(payTrans_11; PayTrans[11])
            {
            }
            column(payTrans_12; PayTrans[12])
            {
            }
            column(payTrans_13; PayTrans[13])
            {
            }
            column(payTrans_14; PayTrans[14])
            {
            }
            column(payTrans_15; PayTrans[15])
            {
            }
            column(payTrans_16; PayTrans[16])
            {
            }
            column(payTrans_17; PayTrans[17])
            {
            }
            column(payTrans_18; PayTrans[18])
            {
            }
            column(payTrans_19; PayTrans[19])
            {
            }
            column(payTrans_20; PayTrans[20])
            {
            }
            column(payTrans_21; PayTrans[21])
            {
            }
            column(payTrans_22; PayTrans[22])
            {
            }
            column(payTrans_23; PayTrans[23])
            {
            }
            column(payTrans_24; PayTrans[24])
            {
            }
            column(payTrans_25; PayTrans[25])
            {
            }
            column(payTrans_26; PayTrans[26])
            {
            }
            column(payTrans_27; PayTrans[27])
            {
            }
            column(payTrans_28; PayTrans[28])
            {
            }
            column(payTrans_29; PayTrans[29])
            {
            }
            column(payTrans_30; PayTrans[30])
            {
            }
            column(payTrans_31; PayTrans[31])
            {
            }
            column(payTrans_32; PayTrans[32])
            {
            }
            column(payTrans_33; PayTrans[33])
            {
            }
            column(payTrans_34; PayTrans[34])
            {
            }
            column(payTrans_35; PayTrans[35])
            {
            }
            column(payTrans_36; PayTrans[36])
            {
            }
            column(payTrans_37; PayTrans[37])
            {
            }
            column(payTrans_38; PayTrans[38])
            {
            }
            column(payTrans_39; PayTrans[39])
            {
            }
            column(payTrans_40; PayTrans[40])
            {
            }
            column(payTrans_41; PayTrans[41])
            {
            }
            column(payTrans_42; PayTrans[42])
            {
            }
            column(payTrans_43; PayTrans[43])
            {
            }
            column(payTrans_44; PayTrans[44])
            {
            }
            column(payTrans_45; PayTrans[45])
            {
            }
            column(payTrans_46; PayTrans[46])
            {
            }
            column(payTrans_47; PayTrans[47])
            {
            }
            column(payTrans_48; PayTrans[48])
            {
            }
            column(payTrans_49; PayTrans[49])
            {
            }
            column(payTrans_50; PayTrans[50])
            {
            }
            column(payTrans_51; PayTrans[51])
            {
            }
            column(payTrans_52; PayTrans[52])
            {
            }
            column(payTrans_53; PayTrans[53])
            {
            }
            column(payTrans_54; PayTrans[54])
            {
            }
            column(payTrans_55; PayTrans[55])
            {
            }
            column(payTrans_56; PayTrans[56])
            {
            }
            column(payTrans_57; PayTrans[57])
            {
            }
            column(payTrans_58; PayTrans[58])
            {
            }
            column(payTrans_59; PayTrans[59])
            {
            }
            column(payTrans_60; PayTrans[60])
            {
            }
            column(payTrans_61; PayTrans[61])
            {
            }
            column(payTrans_62; PayTrans[62])
            {
            }
            column(payTrans_63; PayTrans[63])
            {
            }
            column(payTrans_64; PayTrans[64])
            {
            }
            column(payTrans_65; PayTrans[65])
            {
            }
            column(payTrans_66; PayTrans[66])
            {
            }
            column(payTrans_67; PayTrans[67])
            {
            }
            column(payTrans_68; PayTrans[68])
            {
            }
            column(payTrans_69; PayTrans[69])
            {
            }
            column(payTrans_70; PayTrans[70])
            {
            }
            column(payTrans_71; PayTrans[71])
            {
            }
            column(payTrans_72; PayTrans[72])
            {
            }
            column(payTrans_73; PayTrans[73])
            {
            }
            column(payTrans_74; PayTrans[74])
            {
            }
            column(payTrans_75; PayTrans[75])
            {
            }
            column(payTrans_76; PayTrans[76])
            {
            }
            column(payTrans_77; PayTrans[77])
            {
            }
            column(payTrans_78; PayTrans[78])
            {
            }
            column(payTrans_79; PayTrans[79])
            {
            }
            column(payTrans_80; PayTrans[80])
            {
            }
            column(payTrans_81; PayTrans[81])
            {
            }
            column(payTrans_82; PayTrans[82])
            {
            }
            column(payTrans_83; PayTrans[83])
            {
            }
            column(payTrans_84; PayTrans[84])
            {
            }
            column(payTrans_85; PayTrans[85])
            {
            }
            column(payTrans_86; PayTrans[86])
            {
            }
            column(payTrans_87; PayTrans[87])
            {
            }
            column(payTrans_88; PayTrans[88])
            {
            }
            column(payTrans_89; PayTrans[89])
            {
            }
            column(payTrans_90; PayTrans[90])
            {
            }
            column(payTrans_91; PayTrans[91])
            {
            }
            column(payTrans_92; PayTrans[92])
            {
            }
            column(payTrans_93; PayTrans[93])
            {
            }
            column(payTrans_95; PayTrans[95])
            {
            }
            column(payTrans_94; PayTrans[94])
            {
            }
            column(payTrans_96; PayTrans[96])
            {
            }
            column(payTrans_97; PayTrans[97])
            {
            }
            column(payTrans_98; PayTrans[98])
            {
            }
            column(payTrans_99; PayTrans[99])
            {
            }
            column(payTrans_100; PayTrans[100])
            {
            }
            column(PayTransAmt_1; PayTransAmt[1])
            {
            }
            column(PayTransAmt_2; PayTransAmt[2])
            {
            }
            column(PayTransAmt_3; PayTransAmt[3])
            {
            }
            column(PayTransAmt_4; PayTransAmt[4])
            {
            }
            column(PayTransAmt_5; PayTransAmt[5])
            {
            }
            column(PayTransAmt_6; PayTransAmt[6])
            {
            }
            column(PayTransAmt_7; PayTransAmt[7])
            {
            }
            column(PayTransAmt_8; PayTransAmt[8])
            {
            }
            column(PayTransAmt_9; PayTransAmt[9])
            {
            }
            column(PayTransAmt_10; PayTransAmt[10])
            {
            }
            column(PayTransAmt_11; PayTransAmt[11])
            {
            }
            column(PayTransAmt_12; PayTransAmt[12])
            {
            }
            column(PayTransAmt_13; PayTransAmt[13])
            {
            }
            column(PayTransAmt_14; PayTransAmt[14])
            {
            }
            column(PayTransAmt_15; PayTransAmt[15])
            {
            }
            column(PayTransAmt_16; PayTransAmt[16])
            {
            }
            column(PayTransAmt_17; PayTransAmt[17])
            {
            }
            column(PayTransAmt_18; PayTransAmt[18])
            {
            }
            column(PayTransAmt_19; PayTransAmt[19])
            {
            }
            column(PayTransAmt_20; PayTransAmt[20])
            {
            }
            column(PayTransAmt_21; PayTransAmt[21])
            {
            }
            column(PayTransAmt_22; PayTransAmt[22])
            {
            }
            column(PayTransAmt_23; PayTransAmt[23])
            {
            }
            column(PayTransAmt_24; PayTransAmt[24])
            {
            }
            column(PayTransAmt_25; PayTransAmt[25])
            {
            }
            column(PayTransAmt_26; PayTransAmt[26])
            {
            }
            column(PayTransAmt_27; PayTransAmt[27])
            {
            }
            column(PayTransAmt_28; PayTransAmt[28])
            {
            }
            column(PayTransAmt_29; PayTransAmt[29])
            {
            }
            column(PayTransAmt_30; PayTransAmt[30])
            {
            }
            column(PayTransAmt_31; PayTransAmt[31])
            {
            }
            column(PayTransAmt_32; PayTransAmt[32])
            {
            }
            column(PayTransAmt_33; PayTransAmt[33])
            {
            }
            column(PayTransAmt_34; PayTransAmt[34])
            {
            }
            column(PayTransAmt_35; PayTransAmt[35])
            {
            }
            column(PayTransAmt_36; PayTransAmt[36])
            {
            }
            column(PayTransAmt_37; PayTransAmt[37])
            {
            }
            column(PayTransAmt_38; PayTransAmt[38])
            {
            }
            column(PayTransAmt_39; PayTransAmt[39])
            {
            }
            column(PayTransAmt_40; PayTransAmt[40])
            {
            }
            column(PayTransAmt_41; PayTransAmt[41])
            {
            }
            column(PayTransAmt_42; PayTransAmt[42])
            {
            }
            column(PayTransAmt_43; PayTransAmt[43])
            {
            }
            column(PayTransAmt_44; PayTransAmt[44])
            {
            }
            column(PayTransAmt_45; PayTransAmt[45])
            {
            }
            column(PayTransAmt_46; PayTransAmt[46])
            {
            }
            column(PayTransAmt_47; PayTransAmt[47])
            {
            }
            column(PayTransAmt_48; PayTransAmt[48])
            {
            }
            column(PayTransAmt_49; PayTransAmt[49])
            {
            }
            column(PayTransAmt_50; PayTransAmt[50])
            {
            }
            column(PayTransAmt_51; PayTransAmt[51])
            {
            }
            column(PayTransAmt_52; PayTransAmt[52])
            {
            }
            column(PayTransAmt_53; PayTransAmt[53])
            {
            }
            column(PayTransAmt_54; PayTransAmt[54])
            {
            }
            column(PayTransAmt_55; PayTransAmt[55])
            {
            }
            column(PayTransAmt_56; PayTransAmt[56])
            {
            }
            column(PayTransAmt_57; PayTransAmt[57])
            {
            }
            column(PayTransAmt_58; PayTransAmt[58])
            {
            }
            column(PayTransAmt_59; PayTransAmt[59])
            {
            }
            column(PayTransAmt_60; PayTransAmt[60])
            {
            }
            column(PayTransAmt_61; PayTransAmt[61])
            {
            }
            column(PayTransAmt_62; PayTransAmt[62])
            {
            }
            column(PayTransAmt_63; PayTransAmt[63])
            {
            }
            column(PayTransAmt_64; PayTransAmt[64])
            {
            }
            column(PayTransAmt_65; PayTransAmt[65])
            {
            }
            column(PayTransAmt_66; PayTransAmt[66])
            {
            }
            column(PayTransAmt_67; PayTransAmt[67])
            {
            }
            column(PayTransAmt_68; PayTransAmt[68])
            {
            }
            column(PayTransAmt_69; PayTransAmt[69])
            {
            }
            column(PayTransAmt_70; PayTransAmt[70])
            {
            }
            column(PayTransAmt_71; PayTransAmt[71])
            {
            }
            column(PayTransAmt_72; PayTransAmt[72])
            {
            }
            column(PayTransAmt_73; PayTransAmt[73])
            {
            }
            column(PayTransAmt_74; PayTransAmt[74])
            {
            }
            column(PayTransAmt_75; PayTransAmt[75])
            {
            }
            column(PayTransAmt_76; PayTransAmt[76])
            {
            }
            column(PayTransAmt_77; PayTransAmt[77])
            {
            }
            column(PayTransAmt_78; PayTransAmt[78])
            {
            }
            column(PayTransAmt_79; PayTransAmt[79])
            {
            }
            column(PayTransAmt_80; PayTransAmt[80])
            {
            }
            column(PayTransAmt_81; PayTransAmt[81])
            {
            }
            column(PayTransAmt_82; PayTransAmt[82])
            {
            }
            column(PayTransAmt_83; PayTransAmt[83])
            {
            }
            column(PayTransAmt_84; PayTransAmt[84])
            {
            }
            column(PayTransAmt_85; PayTransAmt[85])
            {
            }
            column(PayTransAmt_86; PayTransAmt[86])
            {
            }
            column(PayTransAmt_87; PayTransAmt[87])
            {
            }
            column(PayTransAmt_88; PayTransAmt[88])
            {
            }
            column(PayTransAmt_89; PayTransAmt[89])
            {
            }
            column(PayTransAmt_90; PayTransAmt[90])
            {
            }


            column(CountEarn_1; CountEarn[1]) { }
            column(CountEarn_2; CountEarn[2]) { }
            column(CountEarn_3; CountEarn[3]) { }
            column(CountEarn_4; CountEarn[4]) { }
            column(CountEarn_5; CountEarn[5]) { }
            column(CountEarn_6; CountEarn[6]) { }
            column(CountEarn_7; CountEarn[7]) { }
            column(CountEarn_8; CountEarn[8]) { }
            column(CountEarn_9; CountEarn[9]) { }
            column(CountEarn_10; CountEarn[10]) { }
            column(CountEarn_11; CountEarn[11]) { }
            column(CountEarn_12; CountEarn[12]) { }
            column(CountEarn_13; CountEarn[13]) { }
            column(CountEarn_14; CountEarn[14]) { }
            column(CountEarn_15; CountEarn[15]) { }
            column(CountEarn_16; CountEarn[16]) { }
            column(CountEarn_17; CountEarn[17]) { }
            column(CountEarn_18; CountEarn[18]) { }
            column(CountEarn_19; CountEarn[19]) { }
            column(CountEarn_20; CountEarn[20]) { }
            column(CountEarn_21; CountEarn[21]) { }
            column(CountEarn_22; CountEarn[22]) { }
            column(CountEarn_23; CountEarn[23]) { }
            column(CountEarn_24; CountEarn[24]) { }
            column(CountEarn_25; CountEarn[25]) { }
            column(CountEarn_26; CountEarn[26]) { }
            column(CountEarn_27; CountEarn[27]) { }
            column(CountEarn_28; CountEarn[28]) { }
            column(CountEarn_29; CountEarn[29]) { }
            column(CountEarn_30; CountEarn[30]) { }
            column(CountEarn_31; CountEarn[31]) { }
            column(CountEarn_32; CountEarn[32]) { }
            column(CountEarn_33; CountEarn[33]) { }
            column(CountEarn_34; CountEarn[34]) { }
            column(CountEarn_35; CountEarn[35]) { }
            column(CountEarn_36; CountEarn[36]) { }
            column(CountEarn_37; CountEarn[37]) { }
            column(CountEarn_38; CountEarn[38]) { }
            column(CountEarn_39; CountEarn[39]) { }
            column(CountEarn_40; CountEarn[40]) { }
            column(CountEarn_41; CountEarn[41]) { }
            column(CountEarn_42; CountEarn[42]) { }
            column(CountEarn_43; CountEarn[43]) { }
            column(CountEarn_44; CountEarn[44]) { }
            column(CountEarn_45; CountEarn[45]) { }
            column(CountEarn_46; CountEarn[46]) { }
            column(CountEarn_47; CountEarn[47]) { }
            column(CountEarn_48; CountEarn[48]) { }
            column(CountEarn_49; CountEarn[49]) { }
            column(CountEarn_50; CountEarn[50]) { }
            column(CountEarn_51; CountEarn[51]) { }
            column(CountEarn_52; CountEarn[52]) { }
            column(CountEarn_53; CountEarn[53]) { }
            column(CountEarn_54; CountEarn[54]) { }
            column(CountEarn_55; CountEarn[55]) { }
            column(CountEarn_56; CountEarn[56]) { }
            column(CountEarn_57; CountEarn[57]) { }
            column(CountEarn_58; CountEarn[58]) { }
            column(CountEarn_59; CountEarn[59]) { }
            column(CountEarn_60; CountEarn[60]) { }
            column(CountEarn_61; CountEarn[61]) { }
            column(CountEarn_62; CountEarn[62]) { }
            column(CountEarn_63; CountEarn[63]) { }
            column(CountEarn_64; CountEarn[64]) { }
            column(CountEarn_65; CountEarn[65]) { }
            column(CountEarn_66; CountEarn[66]) { }
            column(CountEarn_67; CountEarn[67]) { }
            column(CountEarn_68; CountEarn[68]) { }
            column(CountEarn_69; CountEarn[69]) { }
            column(CountEarn_70; CountEarn[70]) { }
            column(CountEarn_71; CountEarn[71]) { }
            column(CountEarn_72; CountEarn[72]) { }
            column(CountEarn_73; CountEarn[73]) { }
            column(CountEarn_74; CountEarn[74]) { }
            column(CountEarn_75; CountEarn[75]) { }
            column(CountEarn_76; CountEarn[76]) { }
            column(CountEarn_77; CountEarn[77]) { }
            column(CountEarn_78; CountEarn[78]) { }
            column(CountEarn_79; CountEarn[79]) { }
            column(CountEarn_80; CountEarn[80]) { }
            column(CountEarn_81; CountEarn[81]) { }
            column(CountEarn_82; CountEarn[82]) { }
            column(CountEarn_83; CountEarn[83]) { }
            column(CountEarn_84; CountEarn[84]) { }
            column(CountEarn_85; CountEarn[85]) { }
            column(CountEarn_86; CountEarn[86]) { }
            column(CountEarn_87; CountEarn[87]) { }
            column(CountEarn_88; CountEarn[88]) { }
            column(CountEarn_89; CountEarn[89]) { }
            column(CountEarn_90; CountEarn[90]) { }
            column(CountEarn_91; CountEarn[91]) { }
            column(CountEarn_92; CountEarn[92]) { }
            column(CountEarn_93; CountEarn[93]) { }
            column(CountEarn_94; CountEarn[94]) { }
            column(CountEarn_95; CountEarn[95]) { }
            column(CountEarn_96; CountEarn[96]) { }
            column(CountEarn_97; CountEarn[97]) { }
            column(CountEarn_98; CountEarn[98]) { }
            column(CountEarn_99; CountEarn[99]) { }
            column(CountEarn_100; CountEarn[100]) { }
            column(DedTrans_1; DedTrans[1])
            {
            }
            column(DedTrans_2; DedTrans[2])
            {
            }
            column(DedTrans_3; DedTrans[3])
            {
            }
            column(DedTrans_4; DedTrans[4])
            {
            }
            column(DedTrans_5; DedTrans[5])
            {
            }
            column(DedTrans_6; DedTrans[6])
            {
            }
            column(DedTrans_7; DedTrans[7])
            {
            }
            column(DedTrans_8; DedTrans[8])
            {
            }
            column(DedTrans_9; DedTrans[9])
            {
            }
            column(DedTrans_10; DedTrans[10])
            {
            }
            column(DedTrans_11; DedTrans[11])
            {
            }
            column(DedTrans_12; DedTrans[12])
            {
            }
            column(DedTrans_13; DedTrans[13])
            {
            }
            column(DedTrans_14; DedTrans[14])
            {
            }
            column(DedTrans_15; DedTrans[15])
            {
            }
            column(DedTrans_16; DedTrans[16])
            {
            }
            column(DedTrans_17; DedTrans[17])
            {
            }
            column(DedTrans_18; DedTrans[18])
            {
            }
            column(DedTrans_19; DedTrans[19])
            {
            }
            column(DedTrans_20; DedTrans[20])
            {
            }
            column(DedTrans_21; DedTrans[21])
            {
            }
            column(DedTrans_22; DedTrans[22])
            {
            }
            column(DedTrans_23; DedTrans[23])
            {
            }
            column(DedTrans_24; DedTrans[24])
            {
            }
            column(DedTrans_25; DedTrans[25])
            {
            }
            column(DedTrans_26; DedTrans[26])
            {
            }
            column(DedTrans_27; DedTrans[27])
            {
            }
            column(DedTrans_28; DedTrans[28])
            {
            }
            column(DedTrans_29; DedTrans[29])
            {
            }
            column(DedTrans_30; DedTrans[30])
            {
            }
            column(DedTrans_31; DedTrans[31])
            {
            }
            column(DedTrans_32; DedTrans[32])
            {
            }
            column(DedTrans_33; DedTrans[33])
            {
            }
            column(DedTrans_34; DedTrans[34])
            {
            }
            column(DedTrans_35; DedTrans[35])
            {
            }
            column(DedTrans_36; DedTrans[36])
            {
            }
            column(DedTrans_37; DedTrans[37])
            {
            }
            column(DedTrans_38; DedTrans[38])
            {
            }
            column(DedTrans_39; DedTrans[39])
            {
            }
            column(DedTrans_40; DedTrans[40])
            {
            }
            column(DedTrans_41; DedTrans[41])
            {
            }
            column(DedTrans_42; DedTrans[42])
            {
            }
            column(DedTrans_43; DedTrans[43])
            {
            }
            column(DedTrans_44; DedTrans[44])
            {
            }
            column(DedTrans_45; DedTrans[45])
            {
            }
            column(DedTrans_46; DedTrans[46])
            {
            }
            column(DedTrans_47; DedTrans[47])
            {
            }
            column(DedTrans_48; DedTrans[48])
            {
            }
            column(DedTrans_49; DedTrans[49])
            {
            }
            column(DedTrans_50; DedTrans[50])
            {
            }
            column(DedTrans_51; DedTrans[51])
            {
            }
            column(DedTrans_52; DedTrans[52])
            {
            }
            column(DedTrans_53; DedTrans[53])
            {
            }
            column(DedTrans_54; DedTrans[54])
            {
            }
            column(DedTrans_55; DedTrans[55])
            {
            }
            column(DedTrans_56; DedTrans[56])
            {
            }
            column(DedTrans_57; DedTrans[57])
            {
            }
            column(DedTrans_58; DedTrans[58])
            {
            }
            column(DedTrans_59; DedTrans[59])
            {
            }
            column(DedTrans_60; DedTrans[60])
            {
            }
            column(DedTrans_61; DedTrans[61])
            {
            }
            column(DedTrans_62; DedTrans[62])
            {
            }
            column(DedTrans_63; DedTrans[63])
            {
            }
            column(DedTrans_64; DedTrans[64])
            {
            }
            column(DedTrans_65; DedTrans[65])
            {
            }
            column(DedTrans_66; DedTrans[66])
            {
            }
            column(DedTrans_67; DedTrans[67])
            {
            }
            column(DedTrans_68; DedTrans[68])
            {
            }
            column(DedTrans_69; DedTrans[69])
            {
            }
            column(DedTrans_70; DedTrans[70])
            {
            }
            column(DedTrans_71; DedTrans[71])
            {
            }
            column(DedTrans_72; DedTrans[72])
            {
            }
            column(DedTrans_73; DedTrans[73])
            {
            }
            column(DedTrans_74; DedTrans[74])
            {
            }
            column(DedTrans_75; DedTrans[75])
            {
            }
            column(DedTrans_76; DedTrans[76])
            {
            }
            column(DedTrans_77; DedTrans[77])
            {
            }
            column(DedTrans_78; DedTrans[78])
            {
            }
            column(DedTrans_79; DedTrans[79])
            {
            }
            column(DedTrans_80; DedTrans[80])
            {
            }
            column(DedTrans_81; DedTrans[81])
            {
            }
            column(DedTrans_82; DedTrans[82])
            {
            }
            column(DedTrans_83; DedTrans[83])
            {
            }
            column(DedTrans_84; DedTrans[84])
            {
            }
            column(DedTrans_85; DedTrans[85])
            {
            }
            column(DedTrans_86; DedTrans[86])
            {
            }
            column(DedTrans_87; DedTrans[87])
            {
            }
            column(DedTrans_88; DedTrans[88])
            {
            }
            column(DedTrans_89; DedTrans[89])
            {
            }
            column(DedTrans_90; DedTrans[90])
            {
            }
            column(DedTrans_91; DedTrans[91])
            {
            }
            column(DedTrans_92; DedTrans[92])
            {
            }
            column(DedTrans_93; DedTrans[93])
            {
            }
            column(DedTrans_94; DedTrans[94])
            {
            }
            column(DedTrans_95; DedTrans[95])
            {
            }
            column(DedTrans_96; DedTrans[96])
            {
            }
            column(DedTrans_97; DedTrans[97])
            {
            }
            column(DedTrans_98; DedTrans[98])
            {
            }
            column(DedTrans_99; DedTrans[99])
            {
            }
            column(DedTrans_100; DedTrans[100])
            {
            }
            column(DedTrans_101; DedTrans[101])
            {
            }
            column(DedTrans_102; DedTrans[102])
            {
            }
            column(DedTrans_103; DedTrans[103])
            {
            }
            column(DedTrans_104; DedTrans[104])
            {
            }
            column(DedTrans_105; DedTrans[105])
            {
            }
            column(DedTrans_106; DedTrans[106])
            {
            }
            column(DedTrans_107; DedTrans[107])
            {
            }
            column(DedTrans_108; DedTrans[108])
            {
            }
            column(DedTrans_109; DedTrans[109])
            {
            }
            column(DedTrans_110; DedTrans[110])
            {
            }

            column(DedTrans_111; DedTrans[111]) { }
            column(DedTrans_112; DedTrans[112]) { }
            column(DedTrans_113; DedTrans[113]) { }
            column(DedTrans_114; DedTrans[114]) { }
            column(DedTrans_115; DedTrans[115]) { }
            column(DedTrans_116; DedTrans[116]) { }
            column(DedTrans_117; DedTrans[117]) { }
            column(DedTrans_118; DedTrans[118]) { }
            column(DedTrans_119; DedTrans[119]) { }
            column(DedTrans_120; DedTrans[120]) { }
            column(DedTrans_121; DedTrans[121]) { }
            column(DedTrans_122; DedTrans[122]) { }
            column(DedTrans_123; DedTrans[123]) { }
            column(DedTrans_124; DedTrans[124]) { }
            column(DedTrans_125; DedTrans[125]) { }
            column(DedTrans_126; DedTrans[126]) { }
            column(DedTrans_127; DedTrans[127]) { }
            column(DedTrans_128; DedTrans[128]) { }
            column(DedTrans_129; DedTrans[129]) { }
            column(DedTrans_130; DedTrans[130]) { }
            column(DedTrans_131; DedTrans[131]) { }
            column(DedTrans_132; DedTrans[132]) { }
            column(DedTrans_133; DedTrans[133]) { }
            column(DedTrans_134; DedTrans[134]) { }
            column(DedTrans_135; DedTrans[135]) { }
            column(DedTrans_136; DedTrans[136]) { }
            column(DedTrans_137; DedTrans[137]) { }
            column(DedTrans_138; DedTrans[138]) { }
            column(DedTrans_139; DedTrans[139]) { }
            column(DedTrans_140; DedTrans[140]) { }
            column(DedTrans_141; DedTrans[141]) { }
            column(DedTrans_142; DedTrans[142]) { }
            column(DedTrans_143; DedTrans[143]) { }
            column(DedTrans_144; DedTrans[144]) { }
            column(DedTrans_145; DedTrans[145]) { }
            column(DedTrans_146; DedTrans[146]) { }
            column(DedTrans_147; DedTrans[147]) { }
            column(DedTrans_148; DedTrans[148]) { }
            column(DedTrans_149; DedTrans[149]) { }
            column(DedTrans_150; DedTrans[150]) { }
            column(DedTrans_151; DedTrans[151]) { }
            column(DedTrans_152; DedTrans[152]) { }
            column(DedTrans_153; DedTrans[153]) { }
            column(DedTrans_154; DedTrans[154]) { }
            column(DedTrans_155; DedTrans[155]) { }
            column(DedTrans_156; DedTrans[156]) { }
            column(DedTrans_157; DedTrans[157]) { }
            column(DedTrans_158; DedTrans[158]) { }
            column(DedTrans_159; DedTrans[159]) { }
            column(DedTrans_160; DedTrans[160]) { }
            column(DedTrans_161; DedTrans[161]) { }
            column(DedTrans_162; DedTrans[162]) { }
            column(DedTrans_163; DedTrans[163]) { }
            column(DedTrans_164; DedTrans[164]) { }
            column(DedTrans_165; DedTrans[165]) { }
            column(DedTrans_166; DedTrans[166]) { }
            column(DedTrans_167; DedTrans[167]) { }
            column(DedTrans_168; DedTrans[168]) { }
            column(DedTrans_169; DedTrans[169]) { }
            column(DedTrans_170; DedTrans[170]) { }
            column(DedTrans_171; DedTrans[171]) { }
            column(DedTrans_172; DedTrans[172]) { }
            column(DedTrans_173; DedTrans[173]) { }
            column(DedTrans_174; DedTrans[174]) { }
            column(DedTrans_175; DedTrans[175]) { }
            column(DedTrans_176; DedTrans[176]) { }
            column(DedTrans_177; DedTrans[177]) { }
            column(DedTrans_178; DedTrans[178]) { }
            column(DedTrans_179; DedTrans[179]) { }
            column(DedTrans_180; DedTrans[180]) { }
            column(DedTrans_181; DedTrans[181]) { }
            column(DedTrans_182; DedTrans[182]) { }
            column(DedTrans_183; DedTrans[183]) { }
            column(DedTrans_184; DedTrans[184]) { }
            column(DedTrans_185; DedTrans[185]) { }
            column(DedTrans_186; DedTrans[186]) { }
            column(DedTrans_187; DedTrans[187]) { }
            column(DedTrans_188; DedTrans[188]) { }
            column(DedTrans_189; DedTrans[189]) { }
            column(DedTrans_190; DedTrans[190]) { }
            column(DedTrans_191; DedTrans[191]) { }
            column(DedTrans_192; DedTrans[192]) { }
            column(DedTrans_193; DedTrans[193]) { }
            column(DedTrans_194; DedTrans[194]) { }
            column(DedTrans_195; DedTrans[195]) { }
            column(DedTrans_196; DedTrans[196]) { }
            column(DedTrans_197; DedTrans[197]) { }
            column(DedTrans_198; DedTrans[198]) { }
            column(DedTrans_199; DedTrans[199]) { }
            column(DedTrans_200; DedTrans[200]) { }
            column(DedTrans_201; DedTrans[201]) { }
            column(DedTrans_202; DedTrans[202]) { }
            column(DedTrans_203; DedTrans[203]) { }
            column(DedTrans_204; DedTrans[204]) { }
            column(DedTrans_205; DedTrans[205]) { }
            column(DedTrans_206; DedTrans[206]) { }
            column(DedTrans_207; DedTrans[207]) { }
            column(DedTrans_208; DedTrans[208]) { }
            column(DedTrans_209; DedTrans[209]) { }
            column(DedTrans_210; DedTrans[210]) { }
            column(DedTrans_211; DedTrans[211]) { }
            column(DedTrans_212; DedTrans[212]) { }
            column(DedTrans_213; DedTrans[213]) { }
            column(DedTrans_214; DedTrans[214]) { }
            column(DedTrans_215; DedTrans[215]) { }
            column(DedTrans_216; DedTrans[216]) { }
            column(DedTrans_217; DedTrans[217]) { }
            column(DedTrans_218; DedTrans[218]) { }
            column(DedTrans_219; DedTrans[219]) { }
            column(DedTrans_220; DedTrans[220]) { }
            column(DedTrans_221; DedTrans[221]) { }
            column(DedTrans_222; DedTrans[222]) { }
            column(DedTrans_223; DedTrans[223]) { }
            column(DedTrans_224; DedTrans[224]) { }
            column(DedTrans_225; DedTrans[225]) { }
            column(DedTrans_226; DedTrans[226]) { }
            column(DedTrans_227; DedTrans[227]) { }
            column(DedTrans_228; DedTrans[228]) { }
            column(DedTrans_229; DedTrans[229]) { }
            column(DedTrans_230; DedTrans[230]) { }
            column(DedTrans_231; DedTrans[231]) { }
            column(DedTrans_232; DedTrans[232]) { }
            column(DedTrans_233; DedTrans[233]) { }
            column(DedTrans_234; DedTrans[234]) { }
            column(DedTrans_235; DedTrans[235]) { }
            column(DedTrans_236; DedTrans[236]) { }
            column(DedTrans_237; DedTrans[237]) { }
            column(DedTrans_238; DedTrans[238]) { }
            column(DedTrans_239; DedTrans[239]) { }
            column(DedTrans_240; DedTrans[240]) { }
            column(DedTrans_241; DedTrans[241]) { }
            column(DedTrans_242; DedTrans[242]) { }
            column(DedTrans_243; DedTrans[243]) { }
            column(DedTrans_244; DedTrans[244]) { }
            column(DedTrans_245; DedTrans[245]) { }
            column(DedTrans_246; DedTrans[246]) { }
            column(DedTrans_247; DedTrans[247]) { }
            column(DedTrans_248; DedTrans[248]) { }
            column(DedTrans_249; DedTrans[249]) { }
            column(DedTrans_250; DedTrans[250]) { }
            column(DedTrans_251; DedTrans[251]) { }
            column(DedTrans_252; DedTrans[252]) { }
            column(DedTrans_253; DedTrans[253]) { }
            column(DedTrans_254; DedTrans[254]) { }
            column(DedTrans_255; DedTrans[255]) { }
            column(DedTrans_256; DedTrans[256]) { }
            column(DedTrans_257; DedTrans[257]) { }
            column(DedTrans_258; DedTrans[258]) { }
            column(DedTrans_259; DedTrans[259]) { }
            column(DedTrans_260; DedTrans[260]) { }
            column(DedTrans_261; DedTrans[261]) { }
            column(DedTrans_262; DedTrans[262]) { }
            column(DedTrans_263; DedTrans[263]) { }
            column(DedTrans_264; DedTrans[264]) { }
            column(DedTrans_265; DedTrans[265]) { }
            column(DedTrans_266; DedTrans[266]) { }
            column(DedTrans_267; DedTrans[267]) { }
            column(DedTrans_268; DedTrans[268]) { }
            column(DedTrans_269; DedTrans[269]) { }
            column(DedTrans_270; DedTrans[270]) { }
            column(DedTrans_271; DedTrans[271]) { }
            column(DedTrans_272; DedTrans[272]) { }
            column(DedTrans_273; DedTrans[273]) { }
            column(DedTrans_274; DedTrans[274]) { }
            column(DedTrans_275; DedTrans[275]) { }
            column(DedTrans_276; DedTrans[276]) { }
            column(DedTrans_277; DedTrans[277]) { }
            column(DedTrans_278; DedTrans[278]) { }
            column(DedTrans_279; DedTrans[279]) { }
            column(DedTrans_280; DedTrans[280]) { }
            column(DedTrans_281; DedTrans[281]) { }
            column(DedTrans_282; DedTrans[282]) { }
            column(DedTrans_283; DedTrans[283]) { }
            column(DedTrans_284; DedTrans[284]) { }
            column(DedTrans_285; DedTrans[285]) { }
            column(DedTrans_286; DedTrans[286]) { }
            column(DedTrans_287; DedTrans[287]) { }
            column(DedTrans_288; DedTrans[288]) { }
            column(DedTrans_289; DedTrans[289]) { }
            column(DedTrans_290; DedTrans[290]) { }
            column(DedTrans_291; DedTrans[291]) { }
            column(DedTrans_292; DedTrans[292]) { }
            column(DedTrans_293; DedTrans[293]) { }
            column(DedTrans_294; DedTrans[294]) { }
            column(DedTrans_295; DedTrans[295]) { }
            column(DedTrans_296; DedTrans[296]) { }
            column(DedTrans_297; DedTrans[297]) { }
            column(DedTrans_298; DedTrans[298]) { }
            column(DedTrans_299; DedTrans[299]) { }
            column(DedTrans_300; DedTrans[300]) { }
            column(DedTrans_301; DedTrans[301]) { }
            column(DedTrans_302; DedTrans[302]) { }
            column(DedTrans_303; DedTrans[303]) { }
            column(DedTrans_304; DedTrans[304]) { }
            column(DedTrans_305; DedTrans[305]) { }
            column(DedTrans_306; DedTrans[306]) { }
            column(DedTrans_307; DedTrans[307]) { }
            column(DedTrans_308; DedTrans[308]) { }
            column(DedTrans_309; DedTrans[309]) { }
            column(DedTrans_310; DedTrans[310]) { }
            column(DedTrans_311; DedTrans[311]) { }
            column(DedTrans_312; DedTrans[312]) { }
            column(DedTrans_313; DedTrans[313]) { }
            column(DedTrans_314; DedTrans[314]) { }
            column(DedTrans_315; DedTrans[315]) { }
            column(DedTrans_316; DedTrans[316]) { }
            column(DedTrans_317; DedTrans[317]) { }
            column(DedTrans_318; DedTrans[318]) { }
            column(DedTrans_319; DedTrans[319]) { }
            column(DedTrans_320; DedTrans[320]) { }
            column(DedTrans_321; DedTrans[321]) { }
            column(DedTrans_322; DedTrans[322]) { }
            column(DedTrans_323; DedTrans[323]) { }
            column(DedTrans_324; DedTrans[324]) { }
            column(DedTrans_325; DedTrans[325]) { }
            column(DedTrans_326; DedTrans[326]) { }
            column(DedTrans_327; DedTrans[327]) { }
            column(DedTrans_328; DedTrans[328]) { }
            column(DedTrans_329; DedTrans[329]) { }
            column(DedTrans_330; DedTrans[330]) { }
            column(DedTrans_331; DedTrans[331]) { }
            column(DedTrans_332; DedTrans[332]) { }
            column(DedTrans_333; DedTrans[333]) { }
            column(DedTrans_334; DedTrans[334]) { }
            column(DedTrans_335; DedTrans[335]) { }
            column(DedTrans_336; DedTrans[336]) { }
            column(DedTrans_337; DedTrans[337]) { }
            column(DedTrans_338; DedTrans[338]) { }
            column(DedTrans_339; DedTrans[339]) { }
            column(DedTrans_340; DedTrans[340]) { }
            column(DedTrans_341; DedTrans[341]) { }
            column(DedTrans_342; DedTrans[342]) { }
            column(DedTrans_343; DedTrans[343]) { }
            column(DedTrans_344; DedTrans[344]) { }
            column(DedTrans_345; DedTrans[345]) { }
            column(DedTrans_346; DedTrans[346]) { }
            column(DedTrans_347; DedTrans[347]) { }
            column(DedTrans_348; DedTrans[348]) { }
            column(DedTrans_349; DedTrans[349]) { }
            column(DedTrans_350; DedTrans[350]) { }
            column(DedTrans_351; DedTrans[351]) { }
            column(DedTrans_352; DedTrans[352]) { }
            column(DedTrans_353; DedTrans[353]) { }
            column(DedTrans_354; DedTrans[354]) { }
            column(DedTrans_355; DedTrans[355]) { }
            column(DedTrans_356; DedTrans[356]) { }
            column(DedTrans_357; DedTrans[357]) { }
            column(DedTrans_358; DedTrans[358]) { }
            column(DedTrans_359; DedTrans[359]) { }
            column(DedTrans_360; DedTrans[360]) { }
            column(DedTrans_361; DedTrans[361]) { }
            column(DedTrans_362; DedTrans[362]) { }
            column(DedTrans_363; DedTrans[363]) { }
            column(DedTrans_364; DedTrans[364]) { }
            column(DedTrans_365; DedTrans[365]) { }
            column(DedTrans_366; DedTrans[366]) { }
            column(DedTrans_367; DedTrans[367]) { }
            column(DedTrans_368; DedTrans[368]) { }
            column(DedTrans_369; DedTrans[369]) { }
            column(DedTrans_370; DedTrans[370]) { }
            column(DedTrans_371; DedTrans[371]) { }
            column(DedTrans_372; DedTrans[372]) { }
            column(DedTrans_373; DedTrans[373]) { }
            column(DedTrans_374; DedTrans[374]) { }
            column(DedTrans_375; DedTrans[375]) { }
            column(DedTrans_376; DedTrans[376]) { }
            column(DedTrans_377; DedTrans[377]) { }
            column(DedTrans_378; DedTrans[378]) { }
            column(DedTrans_379; DedTrans[379]) { }
            column(DedTrans_380; DedTrans[380]) { }
            column(DedTrans_381; DedTrans[381]) { }
            column(DedTrans_382; DedTrans[382]) { }
            column(DedTrans_383; DedTrans[383]) { }
            column(DedTrans_384; DedTrans[384]) { }
            column(DedTrans_385; DedTrans[385]) { }
            column(DedTrans_386; DedTrans[386]) { }
            column(DedTrans_387; DedTrans[387]) { }
            column(DedTrans_388; DedTrans[388]) { }
            column(DedTrans_389; DedTrans[389]) { }
            column(DedTrans_390; DedTrans[390]) { }
            column(DedTrans_391; DedTrans[391]) { }
            column(DedTrans_392; DedTrans[392]) { }
            column(DedTrans_393; DedTrans[393]) { }
            column(DedTrans_394; DedTrans[394]) { }
            column(DedTrans_395; DedTrans[395]) { }
            column(DedTrans_396; DedTrans[396]) { }
            column(DedTrans_397; DedTrans[397]) { }
            column(DedTrans_398; DedTrans[398]) { }
            column(DedTrans_399; DedTrans[399]) { }
            column(DedTrans_400; DedTrans[400]) { }
            column(DedTransAmt_1; DedTransAmt[1])
            {
            }
            column(DedTransAmt_2; DedTransAmt[2])
            {
            }
            column(DedTransAmt_3; DedTransAmt[3])
            {
            }
            column(DedTransAmt_4; DedTransAmt[4])
            {
            }
            column(DedTransAmt_5; DedTransAmt[5])
            {
            }
            column(DedTransAmt_6; DedTransAmt[6])
            {
            }
            column(DedTransAmt_7; DedTransAmt[7])
            {
            }
            column(DedTransAmt_8; DedTransAmt[8])
            {
            }
            column(DedTransAmt_9; DedTransAmt[9])
            {
            }
            column(DedTransAmt_10; DedTransAmt[10])
            {
            }
            column(DedTransAmt_11; DedTransAmt[11])
            {
            }
            column(DedTransAmt_12; DedTransAmt[12])
            {
            }
            column(DedTransAmt_13; DedTransAmt[13])
            {
            }
            column(DedTransAmt_14; DedTransAmt[14])
            {
            }
            column(DedTransAmt_15; DedTransAmt[15])
            {
            }
            column(DedTransAmt_16; DedTransAmt[16])
            {
            }
            column(DedTransAmt_17; DedTransAmt[17])
            {
            }
            column(DedTransAmt_18; DedTransAmt[18])
            {
            }
            column(DedTransAmt_19; DedTransAmt[19])
            {
            }
            column(DedTransAmt_20; DedTransAmt[20])
            {
            }
            column(DedTransAmt_21; DedTransAmt[21])
            {
            }
            column(DedTransAmt_22; DedTransAmt[22])
            {
            }
            column(DedTransAmt_23; DedTransAmt[23])
            {
            }
            column(DedTransAmt_24; DedTransAmt[24])
            {
            }
            column(DedTransAmt_25; DedTransAmt[25])
            {
            }
            column(DedTransAmt_26; DedTransAmt[26])
            {
            }
            column(DedTransAmt_27; DedTransAmt[27])
            {
            }
            column(DedTransAmt_28; DedTransAmt[28])
            {
            }
            column(DedTransAmt_29; DedTransAmt[29])
            {
            }
            column(DedTransAmt_30; DedTransAmt[30])
            {
            }
            column(DedTransAmt_31; DedTransAmt[31])
            {
            }
            column(DedTransAmt_32; DedTransAmt[32])
            {
            }
            column(DedTransAmt_33; DedTransAmt[33])
            {
            }
            column(DedTransAmt_34; DedTransAmt[34])
            {
            }
            column(DedTransAmt_35; DedTransAmt[35])
            {
            }
            column(DedTransAmt_36; DedTransAmt[36])
            {
            }
            column(DedTransAmt_37; DedTransAmt[37])
            {
            }
            column(DedTransAmt_38; DedTransAmt[38])
            {
            }
            column(DedTransAmt_39; DedTransAmt[39])
            {
            }
            column(DedTransAmt_40; DedTransAmt[40])
            {
            }
            column(DedTransAmt_41; DedTransAmt[41])
            {
            }
            column(DedTransAmt_42; DedTransAmt[42])
            {
            }
            column(DedTransAmt_43; DedTransAmt[43])
            {
            }
            column(DedTransAmt_44; DedTransAmt[44])
            {
            }
            column(DedTransAmt_45; DedTransAmt[45])
            {
            }
            column(DedTransAmt_46; DedTransAmt[46])
            {
            }
            column(DedTransAmt_47; DedTransAmt[47])
            {
            }
            column(DedTransAmt_48; DedTransAmt[48])
            {
            }
            column(DedTransAmt_49; DedTransAmt[49])
            {
            }
            column(DedTransAmt_50; DedTransAmt[50])
            {
            }
            column(DedTransAmt_51; DedTransAmt[51])
            {
            }
            column(DedTransAmt_52; DedTransAmt[52])
            {
            }
            column(DedTransAmt_53; DedTransAmt[53])
            {
            }
            column(DedTransAmt_54; DedTransAmt[54])
            {
            }
            column(DedTransAmt_55; DedTransAmt[55])
            {
            }
            column(DedTransAmt_56; DedTransAmt[56])
            {
            }
            column(DedTransAmt_57; DedTransAmt[57])
            {
            }
            column(DedTransAmt_58; DedTransAmt[58])
            {
            }
            column(DedTransAmt_59; DedTransAmt[59])
            {
            }
            column(DedTransAmt_60; DedTransAmt[60])
            {
            }
            column(DedTransAmt_61; DedTransAmt[61])
            {
            }
            column(DedTransAmt_62; DedTransAmt[62])
            {
            }
            column(DedTransAmt_63; DedTransAmt[63])
            {
            }
            column(DedTransAmt_64; DedTransAmt[64])
            {
            }
            column(DedTransAmt_65; DedTransAmt[65])
            {
            }
            column(DedTransAmt_66; DedTransAmt[66])
            {
            }
            column(DedTransAmt_67; DedTransAmt[67])
            {
            }
            column(DedTransAmt_68; DedTransAmt[68])
            {
            }
            column(DedTransAmt_69; DedTransAmt[69])
            {
            }
            column(DedTransAmt_70; DedTransAmt[70])
            {
            }
            column(DedTransAmt_71; DedTransAmt[71])
            {
            }
            column(DedTransAmt_72; DedTransAmt[72])
            {
            }
            column(DedTransAmt_73; DedTransAmt[73])
            {
            }
            column(DedTransAmt_74; DedTransAmt[74])
            {
            }
            column(DedTransAmt_75; DedTransAmt[75])
            {
            }
            column(DedTransAmt_76; DedTransAmt[76])
            {
            }
            column(DedTransAmt_77; DedTransAmt[77])
            {
            }
            column(DedTransAmt_78; DedTransAmt[78])
            {
            }
            column(DedTransAmt_79; DedTransAmt[79])
            {
            }
            column(DedTransAmt_80; DedTransAmt[80])
            {
            }
            column(DedTransAmt_81; DedTransAmt[81])
            {
            }
            column(DedTransAmt_82; DedTransAmt[82])
            {
            }
            column(DedTransAmt_83; DedTransAmt[83])
            {
            }
            column(DedTransAmt_84; DedTransAmt[84])
            {
            }
            column(DedTransAmt_85; DedTransAmt[85])
            {
            }
            column(DedTransAmt_86; DedTransAmt[86])
            {
            }
            column(DedTransAmt_87; DedTransAmt[87])
            {
            }
            column(DedTransAmt_88; DedTransAmt[88])
            {
            }
            column(DedTransAmt_89; DedTransAmt[89])
            {
            }
            column(DedTransAmt_90; DedTransAmt[90])
            {
            }
            column(DedTransAmt_91; DedTransAmt[91])
            {
            }
            column(DedTransAmt_92; DedTransAmt[92])
            {
            }
            column(DedTransAmt_93; DedTransAmt[93])
            {
            }
            column(DedTransAmt_94; DedTransAmt[94])
            {
            }
            column(DedTransAmt_95; DedTransAmt[95])
            {
            }
            column(DedTransAmt_96; DedTransAmt[96])
            {
            }
            column(DedTransAmt_97; DedTransAmt[97])
            {
            }
            column(DedTransAmt_98; DedTransAmt[98])
            {
            }
            column(DedTransAmt_99; DedTransAmt[99])
            {
            }
            column(DedTransAmt_100; DedTransAmt[100])
            {
            }
            column(DedTransAmt_101; DedTransAmt[101])
            {
            }
            column(DedTransAmt_102; DedTransAmt[102])
            {
            }
            column(DedTransAmt_103; DedTransAmt[103])
            {
            }
            column(DedTransAmt_104; DedTransAmt[104])
            {
            }
            column(DedTransAmt_105; DedTransAmt[105])
            {
            }
            column(DedTransAmt_106; DedTransAmt[106])
            {
            }
            column(DedTransAmt_107; DedTransAmt[107])
            {
            }
            column(DedTransAmt_108; DedTransAmt[108])
            {
            }
            column(DedTransAmt_109; DedTransAmt[109])
            {
            }
            column(DedTransAmt_110; DedTransAmt[110])
            {
            }
            column(DedTransAmt_111; DedTransAmt[111]) { }
            column(DedTransAmt_112; DedTransAmt[112]) { }
            column(DedTransAmt_113; DedTransAmt[113]) { }
            column(DedTransAmt_114; DedTransAmt[114]) { }
            column(DedTransAmt_115; DedTransAmt[115]) { }
            column(DedTransAmt_116; DedTransAmt[116]) { }
            column(DedTransAmt_117; DedTransAmt[117]) { }
            column(DedTransAmt_118; DedTransAmt[118]) { }
            column(DedTransAmt_119; DedTransAmt[119]) { }
            column(DedTransAmt_120; DedTransAmt[120]) { }
            column(DedTransAmt_121; DedTransAmt[121]) { }
            column(DedTransAmt_122; DedTransAmt[122]) { }
            column(DedTransAmt_123; DedTransAmt[123]) { }
            column(DedTransAmt_124; DedTransAmt[124]) { }
            column(DedTransAmt_125; DedTransAmt[125]) { }
            column(DedTransAmt_126; DedTransAmt[126]) { }
            column(DedTransAmt_127; DedTransAmt[127]) { }
            column(DedTransAmt_128; DedTransAmt[128]) { }
            column(DedTransAmt_129; DedTransAmt[129]) { }
            column(DedTransAmt_130; DedTransAmt[130]) { }
            column(DedTransAmt_131; DedTransAmt[131]) { }
            column(DedTransAmt_132; DedTransAmt[132]) { }
            column(DedTransAmt_133; DedTransAmt[133]) { }
            column(DedTransAmt_134; DedTransAmt[134]) { }
            column(DedTransAmt_135; DedTransAmt[135]) { }
            column(DedTransAmt_136; DedTransAmt[136]) { }
            column(DedTransAmt_137; DedTransAmt[137]) { }
            column(DedTransAmt_138; DedTransAmt[138]) { }
            column(DedTransAmt_139; DedTransAmt[139]) { }
            column(DedTransAmt_140; DedTransAmt[140]) { }
            column(DedTransAmt_141; DedTransAmt[141]) { }
            column(DedTransAmt_142; DedTransAmt[142]) { }
            column(DedTransAmt_143; DedTransAmt[143]) { }
            column(DedTransAmt_144; DedTransAmt[144]) { }
            column(DedTransAmt_145; DedTransAmt[145]) { }
            column(DedTransAmt_146; DedTransAmt[146]) { }
            column(DedTransAmt_147; DedTransAmt[147]) { }
            column(DedTransAmt_148; DedTransAmt[148]) { }
            column(DedTransAmt_149; DedTransAmt[149]) { }
            column(DedTransAmt_150; DedTransAmt[150]) { }
            column(DedTransAmt_151; DedTransAmt[151]) { }
            column(DedTransAmt_152; DedTransAmt[152]) { }
            column(DedTransAmt_153; DedTransAmt[153]) { }
            column(DedTransAmt_154; DedTransAmt[154]) { }
            column(DedTransAmt_155; DedTransAmt[155]) { }
            column(DedTransAmt_156; DedTransAmt[156]) { }
            column(DedTransAmt_157; DedTransAmt[157]) { }
            column(DedTransAmt_158; DedTransAmt[158]) { }
            column(DedTransAmt_159; DedTransAmt[159]) { }
            column(DedTransAmt_160; DedTransAmt[160]) { }
            column(DedTransAmt_161; DedTransAmt[161]) { }
            column(DedTransAmt_162; DedTransAmt[162]) { }
            column(DedTransAmt_163; DedTransAmt[163]) { }
            column(DedTransAmt_164; DedTransAmt[164]) { }
            column(DedTransAmt_165; DedTransAmt[165]) { }
            column(DedTransAmt_166; DedTransAmt[166]) { }
            column(DedTransAmt_167; DedTransAmt[167]) { }
            column(DedTransAmt_168; DedTransAmt[168]) { }
            column(DedTransAmt_169; DedTransAmt[169]) { }
            column(DedTransAmt_170; DedTransAmt[170]) { }
            column(DedTransAmt_171; DedTransAmt[171]) { }
            column(DedTransAmt_172; DedTransAmt[172]) { }
            column(DedTransAmt_173; DedTransAmt[173]) { }
            column(DedTransAmt_174; DedTransAmt[174]) { }
            column(DedTransAmt_175; DedTransAmt[175]) { }
            column(DedTransAmt_176; DedTransAmt[176]) { }
            column(DedTransAmt_177; DedTransAmt[177]) { }
            column(DedTransAmt_178; DedTransAmt[178]) { }
            column(DedTransAmt_179; DedTransAmt[179]) { }
            column(DedTransAmt_180; DedTransAmt[180]) { }
            column(DedTransAmt_181; DedTransAmt[181]) { }
            column(DedTransAmt_182; DedTransAmt[182]) { }
            column(DedTransAmt_183; DedTransAmt[183]) { }
            column(DedTransAmt_184; DedTransAmt[184]) { }
            column(DedTransAmt_185; DedTransAmt[185]) { }
            column(DedTransAmt_186; DedTransAmt[186]) { }
            column(DedTransAmt_187; DedTransAmt[187]) { }
            column(DedTransAmt_188; DedTransAmt[188]) { }
            column(DedTransAmt_189; DedTransAmt[189]) { }
            column(DedTransAmt_190; DedTransAmt[190]) { }
            column(DedTransAmt_191; DedTransAmt[191]) { }
            column(DedTransAmt_192; DedTransAmt[192]) { }
            column(DedTransAmt_193; DedTransAmt[193]) { }
            column(DedTransAmt_194; DedTransAmt[194]) { }
            column(DedTransAmt_195; DedTransAmt[195]) { }
            column(DedTransAmt_196; DedTransAmt[196]) { }
            column(DedTransAmt_197; DedTransAmt[197]) { }
            column(DedTransAmt_198; DedTransAmt[198]) { }
            column(DedTransAmt_199; DedTransAmt[199]) { }
            column(DedTransAmt_200; DedTransAmt[200]) { }
            column(DedTransAmt_201; DedTransAmt[201]) { }
            column(DedTransAmt_202; DedTransAmt[202]) { }
            column(DedTransAmt_203; DedTransAmt[203]) { }
            column(DedTransAmt_204; DedTransAmt[204]) { }
            column(DedTransAmt_205; DedTransAmt[205]) { }
            column(DedTransAmt_206; DedTransAmt[206]) { }
            column(DedTransAmt_207; DedTransAmt[207]) { }
            column(DedTransAmt_208; DedTransAmt[208]) { }
            column(DedTransAmt_209; DedTransAmt[209]) { }
            column(DedTransAmt_210; DedTransAmt[210]) { }
            column(DedTransAmt_211; DedTransAmt[211]) { }
            column(DedTransAmt_212; DedTransAmt[212]) { }
            column(DedTransAmt_213; DedTransAmt[213]) { }
            column(DedTransAmt_214; DedTransAmt[214]) { }
            column(DedTransAmt_215; DedTransAmt[215]) { }
            column(DedTransAmt_216; DedTransAmt[216]) { }
            column(DedTransAmt_217; DedTransAmt[217]) { }
            column(DedTransAmt_218; DedTransAmt[218]) { }
            column(DedTransAmt_219; DedTransAmt[219]) { }
            column(DedTransAmt_220; DedTransAmt[220]) { }
            column(DedTransAmt_221; DedTransAmt[221]) { }
            column(DedTransAmt_222; DedTransAmt[222]) { }
            column(DedTransAmt_223; DedTransAmt[223]) { }
            column(DedTransAmt_224; DedTransAmt[224]) { }
            column(DedTransAmt_225; DedTransAmt[225]) { }
            column(DedTransAmt_226; DedTransAmt[226]) { }
            column(DedTransAmt_227; DedTransAmt[227]) { }
            column(DedTransAmt_228; DedTransAmt[228]) { }
            column(DedTransAmt_229; DedTransAmt[229]) { }
            column(DedTransAmt_230; DedTransAmt[230]) { }
            column(DedTransAmt_231; DedTransAmt[231]) { }
            column(DedTransAmt_232; DedTransAmt[232]) { }
            column(DedTransAmt_233; DedTransAmt[233]) { }
            column(DedTransAmt_234; DedTransAmt[234]) { }
            column(DedTransAmt_235; DedTransAmt[235]) { }
            column(DedTransAmt_236; DedTransAmt[236]) { }
            column(DedTransAmt_237; DedTransAmt[237]) { }
            column(DedTransAmt_238; DedTransAmt[238]) { }
            column(DedTransAmt_239; DedTransAmt[239]) { }
            column(DedTransAmt_240; DedTransAmt[240]) { }
            column(DedTransAmt_241; DedTransAmt[241]) { }
            column(DedTransAmt_242; DedTransAmt[242]) { }
            column(DedTransAmt_243; DedTransAmt[243]) { }
            column(DedTransAmt_244; DedTransAmt[244]) { }
            column(DedTransAmt_245; DedTransAmt[245]) { }
            column(DedTransAmt_246; DedTransAmt[246]) { }
            column(DedTransAmt_247; DedTransAmt[247]) { }
            column(DedTransAmt_248; DedTransAmt[248]) { }
            column(DedTransAmt_249; DedTransAmt[249]) { }
            column(DedTransAmt_250; DedTransAmt[250]) { }
            column(DedTransAmt_251; DedTransAmt[251]) { }
            column(DedTransAmt_252; DedTransAmt[252]) { }
            column(DedTransAmt_253; DedTransAmt[253]) { }
            column(DedTransAmt_254; DedTransAmt[254]) { }
            column(DedTransAmt_255; DedTransAmt[255]) { }
            column(DedTransAmt_256; DedTransAmt[256]) { }
            column(DedTransAmt_257; DedTransAmt[257]) { }
            column(DedTransAmt_258; DedTransAmt[258]) { }
            column(DedTransAmt_259; DedTransAmt[259]) { }
            column(DedTransAmt_260; DedTransAmt[260]) { }
            column(DedTransAmt_261; DedTransAmt[261]) { }
            column(DedTransAmt_262; DedTransAmt[262]) { }
            column(DedTransAmt_263; DedTransAmt[263]) { }
            column(DedTransAmt_264; DedTransAmt[264]) { }
            column(DedTransAmt_265; DedTransAmt[265]) { }
            column(DedTransAmt_266; DedTransAmt[266]) { }
            column(DedTransAmt_267; DedTransAmt[267]) { }
            column(DedTransAmt_268; DedTransAmt[268]) { }
            column(DedTransAmt_269; DedTransAmt[269]) { }
            column(DedTransAmt_270; DedTransAmt[270]) { }
            column(DedTransAmt_271; DedTransAmt[271]) { }
            column(DedTransAmt_272; DedTransAmt[272]) { }
            column(DedTransAmt_273; DedTransAmt[273]) { }
            column(DedTransAmt_274; DedTransAmt[274]) { }
            column(DedTransAmt_275; DedTransAmt[275]) { }
            column(DedTransAmt_276; DedTransAmt[276]) { }
            column(DedTransAmt_277; DedTransAmt[277]) { }
            column(DedTransAmt_278; DedTransAmt[278]) { }
            column(DedTransAmt_279; DedTransAmt[279]) { }
            column(DedTransAmt_280; DedTransAmt[280]) { }
            column(DedTransAmt_281; DedTransAmt[281]) { }
            column(DedTransAmt_282; DedTransAmt[282]) { }
            column(DedTransAmt_283; DedTransAmt[283]) { }
            column(DedTransAmt_284; DedTransAmt[284]) { }
            column(DedTransAmt_285; DedTransAmt[285]) { }
            column(DedTransAmt_286; DedTransAmt[286]) { }
            column(DedTransAmt_287; DedTransAmt[287]) { }
            column(DedTransAmt_288; DedTransAmt[288]) { }
            column(DedTransAmt_289; DedTransAmt[289]) { }
            column(DedTransAmt_290; DedTransAmt[290]) { }
            column(DedTransAmt_291; DedTransAmt[291]) { }
            column(DedTransAmt_292; DedTransAmt[292]) { }
            column(DedTransAmt_293; DedTransAmt[293]) { }
            column(DedTransAmt_294; DedTransAmt[294]) { }
            column(DedTransAmt_295; DedTransAmt[295]) { }
            column(DedTransAmt_296; DedTransAmt[296]) { }
            column(DedTransAmt_297; DedTransAmt[297]) { }
            column(DedTransAmt_298; DedTransAmt[298]) { }
            column(DedTransAmt_299; DedTransAmt[299]) { }
            column(DedTransAmt_300; DedTransAmt[300]) { }
            column(DedTransAmt_301; DedTransAmt[301]) { }
            column(DedTransAmt_302; DedTransAmt[302]) { }
            column(DedTransAmt_303; DedTransAmt[303]) { }
            column(DedTransAmt_304; DedTransAmt[304]) { }
            column(DedTransAmt_305; DedTransAmt[305]) { }
            column(DedTransAmt_306; DedTransAmt[306]) { }
            column(DedTransAmt_307; DedTransAmt[307]) { }
            column(DedTransAmt_308; DedTransAmt[308]) { }
            column(DedTransAmt_309; DedTransAmt[309]) { }
            column(DedTransAmt_310; DedTransAmt[310]) { }
            column(DedTransAmt_311; DedTransAmt[311]) { }
            column(DedTransAmt_312; DedTransAmt[312]) { }
            column(DedTransAmt_313; DedTransAmt[313]) { }
            column(DedTransAmt_314; DedTransAmt[314]) { }
            column(DedTransAmt_315; DedTransAmt[315]) { }
            column(DedTransAmt_316; DedTransAmt[316]) { }
            column(DedTransAmt_317; DedTransAmt[317]) { }
            column(DedTransAmt_318; DedTransAmt[318]) { }
            column(DedTransAmt_319; DedTransAmt[319]) { }
            column(DedTransAmt_320; DedTransAmt[320]) { }
            column(DedTransAmt_321; DedTransAmt[321]) { }
            column(DedTransAmt_322; DedTransAmt[322]) { }
            column(DedTransAmt_323; DedTransAmt[323]) { }
            column(DedTransAmt_324; DedTransAmt[324]) { }
            column(DedTransAmt_325; DedTransAmt[325]) { }
            column(DedTransAmt_326; DedTransAmt[326]) { }
            column(DedTransAmt_327; DedTransAmt[327]) { }
            column(DedTransAmt_328; DedTransAmt[328]) { }
            column(DedTransAmt_329; DedTransAmt[329]) { }
            column(DedTransAmt_330; DedTransAmt[330]) { }
            column(DedTransAmt_331; DedTransAmt[331]) { }
            column(DedTransAmt_332; DedTransAmt[332]) { }
            column(DedTransAmt_333; DedTransAmt[333]) { }
            column(DedTransAmt_334; DedTransAmt[334]) { }
            column(DedTransAmt_335; DedTransAmt[335]) { }
            column(DedTransAmt_336; DedTransAmt[336]) { }
            column(DedTransAmt_337; DedTransAmt[337]) { }
            column(DedTransAmt_338; DedTransAmt[338]) { }
            column(DedTransAmt_339; DedTransAmt[339]) { }
            column(DedTransAmt_340; DedTransAmt[340]) { }
            column(DedTransAmt_341; DedTransAmt[341]) { }
            column(DedTransAmt_342; DedTransAmt[342]) { }
            column(DedTransAmt_343; DedTransAmt[343]) { }
            column(DedTransAmt_344; DedTransAmt[344]) { }
            column(DedTransAmt_345; DedTransAmt[345]) { }
            column(DedTransAmt_346; DedTransAmt[346]) { }
            column(DedTransAmt_347; DedTransAmt[347]) { }
            column(DedTransAmt_348; DedTransAmt[348]) { }
            column(DedTransAmt_349; DedTransAmt[349]) { }
            column(DedTransAmt_350; DedTransAmt[350]) { }
            column(DedTransAmt_351; DedTransAmt[351]) { }
            column(DedTransAmt_352; DedTransAmt[352]) { }
            column(DedTransAmt_353; DedTransAmt[353]) { }
            column(DedTransAmt_354; DedTransAmt[354]) { }
            column(DedTransAmt_355; DedTransAmt[355]) { }
            column(DedTransAmt_356; DedTransAmt[356]) { }
            column(DedTransAmt_357; DedTransAmt[357]) { }
            column(DedTransAmt_358; DedTransAmt[358]) { }
            column(DedTransAmt_359; DedTransAmt[359]) { }
            column(DedTransAmt_360; DedTransAmt[360]) { }
            column(DedTransAmt_361; DedTransAmt[361]) { }
            column(DedTransAmt_362; DedTransAmt[362]) { }
            column(DedTransAmt_363; DedTransAmt[363]) { }
            column(DedTransAmt_364; DedTransAmt[364]) { }
            column(DedTransAmt_365; DedTransAmt[365]) { }
            column(DedTransAmt_366; DedTransAmt[366]) { }
            column(DedTransAmt_367; DedTransAmt[367]) { }
            column(DedTransAmt_368; DedTransAmt[368]) { }
            column(DedTransAmt_369; DedTransAmt[369]) { }
            column(DedTransAmt_370; DedTransAmt[370]) { }
            column(DedTransAmt_371; DedTransAmt[371]) { }
            column(DedTransAmt_372; DedTransAmt[372]) { }
            column(DedTransAmt_373; DedTransAmt[373]) { }
            column(DedTransAmt_374; DedTransAmt[374]) { }
            column(DedTransAmt_375; DedTransAmt[375]) { }
            column(DedTransAmt_376; DedTransAmt[376]) { }
            column(DedTransAmt_377; DedTransAmt[377]) { }
            column(DedTransAmt_378; DedTransAmt[378]) { }
            column(DedTransAmt_379; DedTransAmt[379]) { }
            column(DedTransAmt_380; DedTransAmt[380]) { }
            column(DedTransAmt_381; DedTransAmt[381]) { }
            column(DedTransAmt_382; DedTransAmt[382]) { }
            column(DedTransAmt_383; DedTransAmt[383]) { }
            column(DedTransAmt_384; DedTransAmt[384]) { }
            column(DedTransAmt_385; DedTransAmt[385]) { }
            column(DedTransAmt_386; DedTransAmt[386]) { }
            column(DedTransAmt_387; DedTransAmt[387]) { }
            column(DedTransAmt_388; DedTransAmt[388]) { }
            column(DedTransAmt_389; DedTransAmt[389]) { }
            column(DedTransAmt_390; DedTransAmt[390]) { }
            column(DedTransAmt_391; DedTransAmt[391]) { }
            column(DedTransAmt_392; DedTransAmt[392]) { }
            column(DedTransAmt_393; DedTransAmt[393]) { }
            column(DedTransAmt_394; DedTransAmt[394]) { }
            column(DedTransAmt_395; DedTransAmt[395]) { }
            column(DedTransAmt_396; DedTransAmt[396]) { }
            column(DedTransAmt_397; DedTransAmt[397]) { }
            column(DedTransAmt_398; DedTransAmt[398]) { }
            column(DedTransAmt_399; DedTransAmt[399]) { }
            column(DedTransAmt_400; DedTransAmt[400]) { }
            column(CountDed_1; CountDed[1]) { }
            column(CountDed_2; CountDed[2]) { }
            column(CountDed_3; CountDed[3]) { }
            column(CountDed_4; CountDed[4]) { }
            column(CountDed_5; CountDed[5]) { }
            column(CountDed_6; CountDed[6]) { }
            column(CountDed_7; CountDed[7]) { }
            column(CountDed_8; CountDed[8]) { }
            column(CountDed_9; CountDed[9]) { }
            column(CountDed_10; CountDed[10]) { }
            column(CountDed_11; CountDed[11]) { }
            column(CountDed_12; CountDed[12]) { }
            column(CountDed_13; CountDed[13]) { }
            column(CountDed_14; CountDed[14]) { }
            column(CountDed_15; CountDed[15]) { }
            column(CountDed_16; CountDed[16]) { }
            column(CountDed_17; CountDed[17]) { }
            column(CountDed_18; CountDed[18]) { }
            column(CountDed_19; CountDed[19]) { }
            column(CountDed_20; CountDed[20]) { }
            column(CountDed_21; CountDed[21]) { }
            column(CountDed_22; CountDed[22]) { }
            column(CountDed_23; CountDed[23]) { }
            column(CountDed_24; CountDed[24]) { }
            column(CountDed_25; CountDed[25]) { }
            column(CountDed_26; CountDed[26]) { }
            column(CountDed_27; CountDed[27]) { }
            column(CountDed_28; CountDed[28]) { }
            column(CountDed_29; CountDed[29]) { }
            column(CountDed_30; CountDed[30]) { }
            column(CountDed_31; CountDed[31]) { }
            column(CountDed_32; CountDed[32]) { }
            column(CountDed_33; CountDed[33]) { }
            column(CountDed_34; CountDed[34]) { }
            column(CountDed_35; CountDed[35]) { }
            column(CountDed_36; CountDed[36]) { }
            column(CountDed_37; CountDed[37]) { }
            column(CountDed_38; CountDed[38]) { }
            column(CountDed_39; CountDed[39]) { }
            column(CountDed_40; CountDed[40]) { }
            column(CountDed_41; CountDed[41]) { }
            column(CountDed_42; CountDed[42]) { }
            column(CountDed_43; CountDed[43]) { }
            column(CountDed_44; CountDed[44]) { }
            column(CountDed_45; CountDed[45]) { }
            column(CountDed_46; CountDed[46]) { }
            column(CountDed_47; CountDed[47]) { }
            column(CountDed_48; CountDed[48]) { }
            column(CountDed_49; CountDed[49]) { }
            column(CountDed_50; CountDed[50]) { }
            column(CountDed_51; CountDed[51]) { }
            column(CountDed_52; CountDed[52]) { }
            column(CountDed_53; CountDed[53]) { }
            column(CountDed_54; CountDed[54]) { }
            column(CountDed_55; CountDed[55]) { }
            column(CountDed_56; CountDed[56]) { }
            column(CountDed_57; CountDed[57]) { }
            column(CountDed_58; CountDed[58]) { }
            column(CountDed_59; CountDed[59]) { }
            column(CountDed_60; CountDed[60]) { }
            column(CountDed_61; CountDed[61]) { }
            column(CountDed_62; CountDed[62]) { }
            column(CountDed_63; CountDed[63]) { }
            column(CountDed_64; CountDed[64]) { }
            column(CountDed_65; CountDed[65]) { }
            column(CountDed_66; CountDed[66]) { }
            column(CountDed_67; CountDed[67]) { }
            column(CountDed_68; CountDed[68]) { }
            column(CountDed_69; CountDed[69]) { }
            column(CountDed_70; CountDed[70]) { }
            column(CountDed_71; CountDed[71]) { }
            column(CountDed_72; CountDed[72]) { }
            column(CountDed_73; CountDed[73]) { }
            column(CountDed_74; CountDed[74]) { }
            column(CountDed_75; CountDed[75]) { }
            column(CountDed_76; CountDed[76]) { }
            column(CountDed_77; CountDed[77]) { }
            column(CountDed_78; CountDed[78]) { }
            column(CountDed_79; CountDed[79]) { }
            column(CountDed_80; CountDed[80]) { }
            column(CountDed_81; CountDed[81]) { }
            column(CountDed_82; CountDed[82]) { }
            column(CountDed_83; CountDed[83]) { }
            column(CountDed_84; CountDed[84]) { }
            column(CountDed_85; CountDed[85]) { }
            column(CountDed_86; CountDed[86]) { }
            column(CountDed_87; CountDed[87]) { }
            column(CountDed_88; CountDed[88]) { }
            column(CountDed_89; CountDed[89]) { }
            column(CountDed_90; CountDed[90]) { }
            column(CountDed_91; CountDed[91]) { }
            column(CountDed_92; CountDed[92]) { }
            column(CountDed_93; CountDed[93]) { }
            column(CountDed_94; CountDed[94]) { }
            column(CountDed_95; CountDed[95]) { }
            column(CountDed_96; CountDed[96]) { }
            column(CountDed_97; CountDed[97]) { }
            column(CountDed_98; CountDed[98]) { }
            column(CountDed_99; CountDed[99]) { }
            column(CountDed_100; CountDed[100]) { }
            column(CountDed_101; CountDed[101]) { }
            column(CountDed_102; CountDed[102]) { }
            column(CountDed_103; CountDed[103]) { }
            column(CountDed_104; CountDed[104]) { }
            column(CountDed_105; CountDed[105]) { }
            column(CountDed_106; CountDed[106]) { }
            column(CountDed_107; CountDed[107]) { }
            column(CountDed_108; CountDed[108]) { }
            column(CountDed_109; CountDed[109]) { }
            column(CountDed_110; CountDed[110]) { }
            column(CountDed_111; CountDed[111]) { }
            column(CountDed_112; CountDed[112]) { }
            column(CountDed_113; CountDed[113]) { }
            column(CountDed_114; CountDed[114]) { }
            column(CountDed_115; CountDed[115]) { }
            column(CountDed_116; CountDed[116]) { }
            column(CountDed_117; CountDed[117]) { }
            column(CountDed_118; CountDed[118]) { }
            column(CountDed_119; CountDed[119]) { }
            column(CountDed_120; CountDed[120]) { }
            column(CountDed_121; CountDed[121]) { }
            column(CountDed_122; CountDed[122]) { }
            column(CountDed_123; CountDed[123]) { }
            column(CountDed_124; CountDed[124]) { }
            column(CountDed_125; CountDed[125]) { }
            column(CountDed_126; CountDed[126]) { }
            column(CountDed_127; CountDed[127]) { }
            column(CountDed_128; CountDed[128]) { }
            column(CountDed_129; CountDed[129]) { }
            column(CountDed_130; CountDed[130]) { }
            column(CountDed_131; CountDed[131]) { }
            column(CountDed_132; CountDed[132]) { }
            column(CountDed_133; CountDed[133]) { }
            column(CountDed_134; CountDed[134]) { }
            column(CountDed_135; CountDed[135]) { }
            column(CountDed_136; CountDed[136]) { }
            column(CountDed_137; CountDed[137]) { }
            column(CountDed_138; CountDed[138]) { }
            column(CountDed_139; CountDed[139]) { }
            column(CountDed_140; CountDed[140]) { }
            column(CountDed_141; CountDed[141]) { }
            column(CountDed_142; CountDed[142]) { }
            column(CountDed_143; CountDed[143]) { }
            column(CountDed_144; CountDed[144]) { }
            column(CountDed_145; CountDed[145]) { }
            column(CountDed_146; CountDed[146]) { }
            column(CountDed_147; CountDed[147]) { }
            column(CountDed_148; CountDed[148]) { }
            column(CountDed_149; CountDed[149]) { }
            column(CountDed_150; CountDed[150]) { }
            column(CountDed_151; CountDed[151]) { }
            column(CountDed_152; CountDed[152]) { }
            column(CountDed_153; CountDed[153]) { }
            column(CountDed_154; CountDed[154]) { }
            column(CountDed_155; CountDed[155]) { }
            column(CountDed_156; CountDed[156]) { }
            column(CountDed_157; CountDed[157]) { }
            column(CountDed_158; CountDed[158]) { }
            column(CountDed_159; CountDed[159]) { }
            column(CountDed_160; CountDed[160]) { }
            column(CountDed_161; CountDed[161]) { }
            column(CountDed_162; CountDed[162]) { }
            column(CountDed_163; CountDed[163]) { }
            column(CountDed_164; CountDed[164]) { }
            column(CountDed_165; CountDed[165]) { }
            column(CountDed_166; CountDed[166]) { }
            column(CountDed_167; CountDed[167]) { }
            column(CountDed_168; CountDed[168]) { }
            column(CountDed_169; CountDed[169]) { }
            column(CountDed_170; CountDed[170]) { }
            column(CountDed_171; CountDed[171]) { }
            column(CountDed_172; CountDed[172]) { }
            column(CountDed_173; CountDed[173]) { }
            column(CountDed_174; CountDed[174]) { }
            column(CountDed_175; CountDed[175]) { }
            column(CountDed_176; CountDed[176]) { }
            column(CountDed_177; CountDed[177]) { }
            column(CountDed_178; CountDed[178]) { }
            column(CountDed_179; CountDed[179]) { }
            column(CountDed_180; CountDed[180]) { }
            column(CountDed_181; CountDed[181]) { }
            column(CountDed_182; CountDed[182]) { }
            column(CountDed_183; CountDed[183]) { }
            column(CountDed_184; CountDed[184]) { }
            column(CountDed_185; CountDed[185]) { }
            column(CountDed_186; CountDed[186]) { }
            column(CountDed_187; CountDed[187]) { }
            column(CountDed_188; CountDed[188]) { }
            column(CountDed_189; CountDed[189]) { }
            column(CountDed_190; CountDed[190]) { }
            column(CountDed_191; CountDed[191]) { }
            column(CountDed_192; CountDed[192]) { }
            column(CountDed_193; CountDed[193]) { }
            column(CountDed_194; CountDed[194]) { }
            column(CountDed_195; CountDed[195]) { }
            column(CountDed_196; CountDed[196]) { }
            column(CountDed_197; CountDed[197]) { }
            column(CountDed_198; CountDed[198]) { }
            column(CountDed_199; CountDed[199]) { }
            column(CountDed_200; CountDed[200]) { }
            column(CountDed_201; CountDed[201]) { }
            column(CountDed_202; CountDed[202]) { }
            column(CountDed_203; CountDed[203]) { }
            column(CountDed_204; CountDed[204]) { }
            column(CountDed_205; CountDed[205]) { }
            column(CountDed_206; CountDed[206]) { }
            column(CountDed_207; CountDed[207]) { }
            column(CountDed_208; CountDed[208]) { }
            column(CountDed_209; CountDed[209]) { }
            column(CountDed_210; CountDed[210]) { }
            column(CountDed_211; CountDed[211]) { }
            column(CountDed_212; CountDed[212]) { }
            column(CountDed_213; CountDed[213]) { }
            column(CountDed_214; CountDed[214]) { }
            column(CountDed_215; CountDed[215]) { }
            column(CountDed_216; CountDed[216]) { }
            column(CountDed_217; CountDed[217]) { }
            column(CountDed_218; CountDed[218]) { }
            column(CountDed_219; CountDed[219]) { }
            column(CountDed_220; CountDed[220]) { }
            column(CountDed_221; CountDed[221]) { }
            column(CountDed_222; CountDed[222]) { }
            column(CountDed_223; CountDed[223]) { }
            column(CountDed_224; CountDed[224]) { }
            column(CountDed_225; CountDed[225]) { }
            column(CountDed_226; CountDed[226]) { }
            column(CountDed_227; CountDed[227]) { }
            column(CountDed_228; CountDed[228]) { }
            column(CountDed_229; CountDed[229]) { }
            column(CountDed_230; CountDed[230]) { }
            column(CountDed_231; CountDed[231]) { }
            column(CountDed_232; CountDed[232]) { }
            column(CountDed_233; CountDed[233]) { }
            column(CountDed_234; CountDed[234]) { }
            column(CountDed_235; CountDed[235]) { }
            column(CountDed_236; CountDed[236]) { }
            column(CountDed_237; CountDed[237]) { }
            column(CountDed_238; CountDed[238]) { }
            column(CountDed_239; CountDed[239]) { }
            column(CountDed_240; CountDed[240]) { }
            column(CountDed_241; CountDed[241]) { }
            column(CountDed_242; CountDed[242]) { }
            column(CountDed_243; CountDed[243]) { }
            column(CountDed_244; CountDed[244]) { }
            column(CountDed_245; CountDed[245]) { }
            column(CountDed_246; CountDed[246]) { }
            column(CountDed_247; CountDed[247]) { }
            column(CountDed_248; CountDed[248]) { }
            column(CountDed_249; CountDed[249]) { }
            column(CountDed_250; CountDed[250]) { }
            column(CountDed_251; CountDed[251]) { }
            column(CountDed_252; CountDed[252]) { }
            column(CountDed_253; CountDed[253]) { }
            column(CountDed_254; CountDed[254]) { }
            column(CountDed_255; CountDed[255]) { }
            column(CountDed_256; CountDed[256]) { }
            column(CountDed_257; CountDed[257]) { }
            column(CountDed_258; CountDed[258]) { }
            column(CountDed_259; CountDed[259]) { }
            column(CountDed_260; CountDed[260]) { }
            column(CountDed_261; CountDed[261]) { }
            column(CountDed_262; CountDed[262]) { }
            column(CountDed_263; CountDed[263]) { }
            column(CountDed_264; CountDed[264]) { }
            column(CountDed_265; CountDed[265]) { }
            column(CountDed_266; CountDed[266]) { }
            column(CountDed_267; CountDed[267]) { }
            column(CountDed_268; CountDed[268]) { }
            column(CountDed_269; CountDed[269]) { }
            column(CountDed_270; CountDed[270]) { }
            column(CountDed_271; CountDed[271]) { }
            column(CountDed_272; CountDed[272]) { }
            column(CountDed_273; CountDed[273]) { }
            column(CountDed_274; CountDed[274]) { }
            column(CountDed_275; CountDed[275]) { }
            column(CountDed_276; CountDed[276]) { }
            column(CountDed_277; CountDed[277]) { }
            column(CountDed_278; CountDed[278]) { }
            column(CountDed_279; CountDed[279]) { }
            column(CountDed_280; CountDed[280]) { }
            column(CountDed_281; CountDed[281]) { }
            column(CountDed_282; CountDed[282]) { }
            column(CountDed_283; CountDed[283]) { }
            column(CountDed_284; CountDed[284]) { }
            column(CountDed_285; CountDed[285]) { }
            column(CountDed_286; CountDed[286]) { }
            column(CountDed_287; CountDed[287]) { }
            column(CountDed_288; CountDed[288]) { }
            column(CountDed_289; CountDed[289]) { }
            column(CountDed_290; CountDed[290]) { }
            column(CountDed_291; CountDed[291]) { }
            column(CountDed_292; CountDed[292]) { }
            column(CountDed_293; CountDed[293]) { }
            column(CountDed_294; CountDed[294]) { }
            column(CountDed_295; CountDed[295]) { }
            column(CountDed_296; CountDed[296]) { }
            column(CountDed_297; CountDed[297]) { }
            column(CountDed_298; CountDed[298]) { }
            column(CountDed_299; CountDed[299]) { }
            column(CountDed_300; CountDed[300]) { }
            column(CountDed_301; CountDed[301]) { }
            column(CountDed_302; CountDed[302]) { }
            column(CountDed_303; CountDed[303]) { }
            column(CountDed_304; CountDed[304]) { }
            column(CountDed_305; CountDed[305]) { }
            column(CountDed_306; CountDed[306]) { }
            column(CountDed_307; CountDed[307]) { }
            column(CountDed_308; CountDed[308]) { }
            column(CountDed_309; CountDed[309]) { }
            column(CountDed_310; CountDed[310]) { }
            column(CountDed_311; CountDed[311]) { }
            column(CountDed_312; CountDed[312]) { }
            column(CountDed_313; CountDed[313]) { }
            column(CountDed_314; CountDed[314]) { }
            column(CountDed_315; CountDed[315]) { }
            column(CountDed_316; CountDed[316]) { }
            column(CountDed_317; CountDed[317]) { }
            column(CountDed_318; CountDed[318]) { }
            column(CountDed_319; CountDed[319]) { }
            column(CountDed_320; CountDed[320]) { }
            column(CountDed_321; CountDed[321]) { }
            column(CountDed_322; CountDed[322]) { }
            column(CountDed_323; CountDed[323]) { }
            column(CountDed_324; CountDed[324]) { }
            column(CountDed_325; CountDed[325]) { }
            column(CountDed_326; CountDed[326]) { }
            column(CountDed_327; CountDed[327]) { }
            column(CountDed_328; CountDed[328]) { }
            column(CountDed_329; CountDed[329]) { }
            column(CountDed_330; CountDed[330]) { }
            column(CountDed_331; CountDed[331]) { }
            column(CountDed_332; CountDed[332]) { }
            column(CountDed_333; CountDed[333]) { }
            column(CountDed_334; CountDed[334]) { }
            column(CountDed_335; CountDed[335]) { }
            column(CountDed_336; CountDed[336]) { }
            column(CountDed_337; CountDed[337]) { }
            column(CountDed_338; CountDed[338]) { }
            column(CountDed_339; CountDed[339]) { }
            column(CountDed_340; CountDed[340]) { }
            column(CountDed_341; CountDed[341]) { }
            column(CountDed_342; CountDed[342]) { }
            column(CountDed_343; CountDed[343]) { }
            column(CountDed_344; CountDed[344]) { }
            column(CountDed_345; CountDed[345]) { }
            column(CountDed_346; CountDed[346]) { }
            column(CountDed_347; CountDed[347]) { }
            column(CountDed_348; CountDed[348]) { }
            column(CountDed_349; CountDed[349]) { }
            column(CountDed_350; CountDed[350]) { }
            column(CountDed_351; CountDed[351]) { }
            column(CountDed_352; CountDed[352]) { }
            column(CountDed_353; CountDed[353]) { }
            column(CountDed_354; CountDed[354]) { }
            column(CountDed_355; CountDed[355]) { }
            column(CountDed_356; CountDed[356]) { }
            column(CountDed_357; CountDed[357]) { }
            column(CountDed_358; CountDed[358]) { }
            column(CountDed_359; CountDed[359]) { }
            column(CountDed_360; CountDed[360]) { }
            column(CountDed_361; CountDed[361]) { }
            column(CountDed_362; CountDed[362]) { }
            column(CountDed_363; CountDed[363]) { }
            column(CountDed_364; CountDed[364]) { }
            column(CountDed_365; CountDed[365]) { }
            column(CountDed_366; CountDed[366]) { }
            column(CountDed_367; CountDed[367]) { }
            column(CountDed_368; CountDed[368]) { }
            column(CountDed_369; CountDed[369]) { }
            column(CountDed_370; CountDed[370]) { }
            column(CountDed_371; CountDed[371]) { }
            column(CountDed_372; CountDed[372]) { }
            column(CountDed_373; CountDed[373]) { }
            column(CountDed_374; CountDed[374]) { }
            column(CountDed_375; CountDed[375]) { }
            column(CountDed_376; CountDed[376]) { }
            column(CountDed_377; CountDed[377]) { }
            column(CountDed_378; CountDed[378]) { }
            column(CountDed_379; CountDed[379]) { }
            column(CountDed_380; CountDed[380]) { }
            column(CountDed_381; CountDed[381]) { }
            column(CountDed_382; CountDed[382]) { }
            column(CountDed_383; CountDed[383]) { }
            column(CountDed_384; CountDed[384]) { }
            column(CountDed_385; CountDed[385]) { }
            column(CountDed_386; CountDed[386]) { }
            column(CountDed_387; CountDed[387]) { }
            column(CountDed_388; CountDed[388]) { }
            column(CountDed_389; CountDed[389]) { }
            column(CountDed_390; CountDed[390]) { }
            column(CountDed_391; CountDed[391]) { }
            column(CountDed_392; CountDed[392]) { }
            column(CountDed_393; CountDed[393]) { }
            column(CountDed_394; CountDed[394]) { }
            column(CountDed_395; CountDed[395]) { }
            column(CountDed_396; CountDed[396]) { }
            column(CountDed_397; CountDed[397]) { }
            column(CountDed_398; CountDed[398]) { }
            column(CountDed_399; CountDed[399]) { }
            column(CountDed_400; CountDed[400]) { }
            column(EmployerDeductionName_1; EmployerDeductionName[1]) { }
            column(EmployerDeductionName_2; EmployerDeductionName[2]) { }
            column(EmployerDeductionName_3; EmployerDeductionName[3]) { }
            column(EmployerDeductionName_4; EmployerDeductionName[4]) { }
            column(EmployerDeductionName_5; EmployerDeductionName[5]) { }
            column(EmployerDeductionName_6; EmployerDeductionName[6]) { }
            column(EmployerDeductionAmount_1; EmployerDeductionAmount[1]) { }
            column(EmployerDeductionAmount_2; EmployerDeductionAmount[2]) { }
            column(EmployerDeductionAmount_3; EmployerDeductionAmount[3]) { }
            column(EmployerDeductionAmount_4; EmployerDeductionAmount[4]) { }
            column(EmployerDeductionAmount_5; EmployerDeductionAmount[5]) { }
            column(EmployerDeductionAmount_6; EmployerDeductionAmount[6]) { }
            column(EmpDedNo1; EmpDedNo[1]) { }
            column(EmpDedNo2; EmpDedNo[2]) { }
            column(EmpDedNo3; EmpDedNo[3]) { }
            column(EmpDedNo4; EmpDedNo[4]) { }
            column(EmpDedNo5; EmpDedNo[5]) { }
            column(EmpDedNo6; EmpDedNo[6]) { }
            column(TotalEmployerDecuctions; TotalEmployerDecuctions) { }
            column(BenefitName_1; BenefitName[1]) { }
            column(BenefitName_2; BenefitName[2]) { }
            column(BenefitName_3; BenefitName[3]) { }
            column(BenefitName_4; BenefitName[4]) { }
            column(BenefitAmount1; BenefitAmount[1]) { }
            column(BenefitAmount2; BenefitAmount[2]) { }
            column(BenefitAmount3; BenefitAmount[3]) { }
            column(BenefitAmount4; BenefitAmount[4]) { }
            column(BenefitTotal; BenefitTotal) { }

            column(BenefitNo1; BenefitNo[1]) { }
            column(BenefitNo2; BenefitNo[2]) { }
            column(BenefitNo3; BenefitNo[3]) { }
            column(BenefitNo4; BenefitNo[4]) { }
            column(GLBen1; GLBen[1]) { }
            column(GLBen2; GLBen[2]) { }
            column(GLBen3; GLBen[3]) { }
            column(GLBen4; GLBen[4]) { }

            column(GLEarn1; GLEarn[1]) { }
            column(GLEarn2; GLEarn[2]) { }
            column(GLEarn3; GLEarn[3]) { }
            column(GLEarn4; GLEarn[4]) { }
            column(GLEarn5; GLEarn[5]) { }
            column(GLEarn6; GLEarn[6]) { }
            column(GLEarn7; GLEarn[7]) { }
            column(GLEarn8; GLEarn[8]) { }
            column(GLEarn9; GLEarn[9]) { }
            column(GLEarn10; GLEarn[10]) { }
            column(GLEarn11; GLEarn[11]) { }
            column(GLEarn12; GLEarn[12]) { }
            column(GLEarn13; GLEarn[13]) { }
            column(GLEarn14; GLEarn[14]) { }
            column(GLEarn15; GLEarn[15]) { }
            column(GLEarn16; GLEarn[16]) { }
            column(GLEarn17; GLEarn[17]) { }
            column(GLEarn18; GLEarn[18]) { }
            column(GLEarn19; GLEarn[19]) { }
            column(GLEarn20; GLEarn[20]) { }
            column(GLEarn21; GLEarn[21]) { }
            column(GLEarn22; GLEarn[22]) { }
            column(GLEarn23; GLEarn[23]) { }
            column(GLEarn24; GLEarn[24]) { }
            column(GLEarn25; GLEarn[25]) { }
            column(GLEarn26; GLEarn[26]) { }
            column(GLEarn27; GLEarn[27]) { }
            column(GLEarn28; GLEarn[28]) { }
            column(GLEarn29; GLEarn[29]) { }
            column(GLEarn30; GLEarn[30]) { }
            column(GLEarn31; GLEarn[31]) { }
            column(GLEarn32; GLEarn[32]) { }
            column(GLEarn33; GLEarn[33]) { }
            column(GLEarn34; GLEarn[34]) { }
            column(GLEarn35; GLEarn[35]) { }
            column(GLEarn36; GLEarn[36]) { }
            column(GLEarn37; GLEarn[37]) { }
            column(GLEarn38; GLEarn[38]) { }
            column(GLEarn39; GLEarn[39]) { }
            column(GLEarn40; GLEarn[40]) { }
            column(GLEarn41; GLEarn[41]) { }
            column(GLEarn42; GLEarn[42]) { }
            column(GLEarn43; GLEarn[43]) { }
            column(GLEarn44; GLEarn[44]) { }
            column(GLEarn45; GLEarn[45]) { }
            column(GLEarn46; GLEarn[46]) { }
            column(GLEarn47; GLEarn[47]) { }
            column(GLEarn48; GLEarn[48]) { }
            column(GLEarn49; GLEarn[49]) { }
            column(GLEarn50; GLEarn[50]) { }
            column(GLEarn51; GLEarn[51]) { }
            column(GLEarn52; GLEarn[52]) { }
            column(GLEarn53; GLEarn[53]) { }
            column(GLEarn54; GLEarn[54]) { }
            column(GLEarn55; GLEarn[55]) { }
            column(GLEarn56; GLEarn[56]) { }
            column(GLEarn57; GLEarn[57]) { }
            column(GLEarn58; GLEarn[58]) { }
            column(GLEarn59; GLEarn[59]) { }
            column(GLEarn60; GLEarn[60]) { }
            column(GLEarn61; GLEarn[61]) { }
            column(GLEarn62; GLEarn[62]) { }
            column(GLEarn63; GLEarn[63]) { }
            column(GLEarn64; GLEarn[64]) { }
            column(GLEarn65; GLEarn[65]) { }
            column(GLEarn66; GLEarn[66]) { }
            column(GLEarn67; GLEarn[67]) { }
            column(GLEarn68; GLEarn[68]) { }
            column(GLEarn69; GLEarn[69]) { }
            column(GLEarn70; GLEarn[70]) { }
            column(GLEarn71; GLEarn[71]) { }
            column(GLEarn72; GLEarn[72]) { }
            column(GLEarn73; GLEarn[73]) { }
            column(GLEarn74; GLEarn[74]) { }
            column(GLEarn75; GLEarn[75]) { }
            column(GLEarn76; GLEarn[76]) { }
            column(GLEarn77; GLEarn[77]) { }
            column(GLEarn78; GLEarn[78]) { }
            column(GLEarn79; GLEarn[79]) { }
            column(GLEarn80; GLEarn[80]) { }
            column(GLEarn81; GLEarn[81]) { }
            column(GLEarn82; GLEarn[82]) { }
            column(GLEarn83; GLEarn[83]) { }
            column(GLEarn84; GLEarn[84]) { }
            column(GLEarn85; GLEarn[85]) { }
            column(GLEarn86; GLEarn[86]) { }
            column(GLEarn87; GLEarn[87]) { }
            column(GLEarn88; GLEarn[88]) { }
            column(GLEarn89; GLEarn[89]) { }
            column(GLEarn90; GLEarn[90]) { }
            column(GLEarn91; GLEarn[91]) { }
            column(GLEarn92; GLEarn[92]) { }
            column(GLEarn93; GLEarn[93]) { }
            column(GLEarn94; GLEarn[94]) { }
            column(GLEarn95; GLEarn[95]) { }
            column(GLEarn96; GLEarn[96]) { }
            column(GLEarn97; GLEarn[97]) { }
            column(GLEarn98; GLEarn[98]) { }
            column(GLEarn99; GLEarn[99]) { }
            column(GLEarn100; GLEarn[100]) { }
            column(GLDed1; GLDed[1]) { }
            column(GLDed2; GLDed[2]) { }
            column(GLDed3; GLDed[3]) { }
            column(GLDed4; GLDed[4]) { }
            column(GLDed5; GLDed[5]) { }
            column(GLDed6; GLDed[6]) { }
            column(GLDed7; GLDed[7]) { }
            column(GLDed8; GLDed[8]) { }
            column(GLDed9; GLDed[9]) { }
            column(GLDed10; GLDed[10]) { }
            column(GLDed11; GLDed[11]) { }
            column(GLDed12; GLDed[12]) { }
            column(GLDed13; GLDed[13]) { }
            column(GLDed14; GLDed[14]) { }
            column(GLDed15; GLDed[15]) { }
            column(GLDed16; GLDed[16]) { }
            column(GLDed17; GLDed[17]) { }
            column(GLDed18; GLDed[18]) { }
            column(GLDed19; GLDed[19]) { }
            column(GLDed20; GLDed[20]) { }
            column(GLDed21; GLDed[21]) { }
            column(GLDed22; GLDed[22]) { }
            column(GLDed23; GLDed[23]) { }
            column(GLDed24; GLDed[24]) { }
            column(GLDed25; GLDed[25]) { }
            column(GLDed26; GLDed[26]) { }
            column(GLDed27; GLDed[27]) { }
            column(GLDed28; GLDed[28]) { }
            column(GLDed29; GLDed[29]) { }
            column(GLDed30; GLDed[30]) { }
            column(GLDed31; GLDed[31]) { }
            column(GLDed32; GLDed[32]) { }
            column(GLDed33; GLDed[33]) { }
            column(GLDed34; GLDed[34]) { }
            column(GLDed35; GLDed[35]) { }
            column(GLDed36; GLDed[36]) { }
            column(GLDed37; GLDed[37]) { }
            column(GLDed38; GLDed[38]) { }
            column(GLDed39; GLDed[39]) { }
            column(GLDed40; GLDed[40]) { }
            column(GLDed41; GLDed[41]) { }
            column(GLDed42; GLDed[42]) { }
            column(GLDed43; GLDed[43]) { }
            column(GLDed44; GLDed[44]) { }
            column(GLDed45; GLDed[45]) { }
            column(GLDed46; GLDed[46]) { }
            column(GLDed47; GLDed[47]) { }
            column(GLDed48; GLDed[48]) { }
            column(GLDed49; GLDed[49]) { }
            column(GLDed50; GLDed[50]) { }
            column(GLDed51; GLDed[51]) { }
            column(GLDed52; GLDed[52]) { }
            column(GLDed53; GLDed[53]) { }
            column(GLDed54; GLDed[54]) { }
            column(GLDed55; GLDed[55]) { }
            column(GLDed56; GLDed[56]) { }
            column(GLDed57; GLDed[57]) { }
            column(GLDed58; GLDed[58]) { }
            column(GLDed59; GLDed[59]) { }
            column(GLDed60; GLDed[60]) { }
            column(GLDed61; GLDed[61]) { }
            column(GLDed62; GLDed[62]) { }
            column(GLDed63; GLDed[63]) { }
            column(GLDed64; GLDed[64]) { }
            column(GLDed65; GLDed[65]) { }
            column(GLDed66; GLDed[66]) { }
            column(GLDed67; GLDed[67]) { }
            column(GLDed68; GLDed[68]) { }
            column(GLDed69; GLDed[69]) { }
            column(GLDed70; GLDed[70]) { }
            column(GLDed71; GLDed[71]) { }
            column(GLDed72; GLDed[72]) { }
            column(GLDed73; GLDed[73]) { }
            column(GLDed74; GLDed[74]) { }
            column(GLDed75; GLDed[75]) { }
            column(GLDed76; GLDed[76]) { }
            column(GLDed77; GLDed[77]) { }
            column(GLDed78; GLDed[78]) { }
            column(GLDed79; GLDed[79]) { }
            column(GLDed80; GLDed[80]) { }
            column(GLDed81; GLDed[81]) { }
            column(GLDed82; GLDed[82]) { }
            column(GLDed83; GLDed[83]) { }
            column(GLDed84; GLDed[84]) { }
            column(GLDed85; GLDed[85]) { }
            column(GLDed86; GLDed[86]) { }
            column(GLDed87; GLDed[87]) { }
            column(GLDed88; GLDed[88]) { }
            column(GLDed89; GLDed[89]) { }
            column(GLDed90; GLDed[90]) { }
            column(GLDed91; GLDed[91]) { }
            column(GLDed92; GLDed[92]) { }
            column(GLDed93; GLDed[93]) { }
            column(GLDed94; GLDed[94]) { }
            column(GLDed95; GLDed[95]) { }
            column(GLDed96; GLDed[96]) { }
            column(GLDed97; GLDed[97]) { }
            column(GLDed98; GLDed[98]) { }
            column(GLDed99; GLDed[99]) { }
            column(GLDed100; GLDed[100]) { }
            column(GLDed101; GLDed[101]) { }
            column(GLDed102; GLDed[102]) { }
            column(GLDed103; GLDed[103]) { }
            column(GLDed104; GLDed[104]) { }
            column(GLDed105; GLDed[105]) { }
            column(GLDed106; GLDed[106]) { }
            column(GLDed107; GLDed[107]) { }
            column(GLDed108; GLDed[108]) { }
            column(GLDed109; GLDed[109]) { }
            column(GLDed110; GLDed[110]) { }
            column(GLDed111; GLDed[111]) { }
            column(GLDed112; GLDed[112]) { }
            column(GLDed113; GLDed[113]) { }
            column(GLDed114; GLDed[114]) { }
            column(GLDed115; GLDed[115]) { }
            column(GLDed116; GLDed[116]) { }
            column(GLDed117; GLDed[117]) { }
            column(GLDed118; GLDed[118]) { }
            column(GLDed119; GLDed[119]) { }
            column(GLDed120; GLDed[120]) { }
            column(GLDed121; GLDed[121]) { }
            column(GLDed122; GLDed[122]) { }
            column(GLDed123; GLDed[123]) { }
            column(GLDed124; GLDed[124]) { }
            column(GLDed125; GLDed[125]) { }
            column(GLDed126; GLDed[126]) { }
            column(GLDed127; GLDed[127]) { }
            column(GLDed128; GLDed[128]) { }
            column(GLDed129; GLDed[129]) { }
            column(GLDed130; GLDed[130]) { }
            column(GLDed131; GLDed[131]) { }
            column(GLDed132; GLDed[132]) { }
            column(GLDed133; GLDed[133]) { }
            column(GLDed134; GLDed[134]) { }
            column(GLDed135; GLDed[135]) { }
            column(GLDed136; GLDed[136]) { }
            column(GLDed137; GLDed[137]) { }
            column(GLDed138; GLDed[138]) { }
            column(GLDed139; GLDed[139]) { }
            column(GLDed140; GLDed[140]) { }
            column(GLDed141; GLDed[141]) { }
            column(GLDed142; GLDed[142]) { }
            column(GLDed143; GLDed[143]) { }
            column(GLDed144; GLDed[144]) { }
            column(GLDed145; GLDed[145]) { }
            column(GLDed146; GLDed[146]) { }
            column(GLDed147; GLDed[147]) { }
            column(GLDed148; GLDed[148]) { }
            column(GLDed149; GLDed[149]) { }
            column(GLDed150; GLDed[150]) { }
            column(GLDed151; GLDed[151]) { }
            column(GLDed152; GLDed[152]) { }
            column(GLDed153; GLDed[153]) { }
            column(GLDed154; GLDed[154]) { }
            column(GLDed155; GLDed[155]) { }
            column(GLDed156; GLDed[156]) { }
            column(GLDed157; GLDed[157]) { }
            column(GLDed158; GLDed[158]) { }
            column(GLDed159; GLDed[159]) { }
            column(GLDed160; GLDed[160]) { }
            column(GLDed161; GLDed[161]) { }
            column(GLDed162; GLDed[162]) { }
            column(GLDed163; GLDed[163]) { }
            column(GLDed164; GLDed[164]) { }
            column(GLDed165; GLDed[165]) { }
            column(GLDed166; GLDed[166]) { }
            column(GLDed167; GLDed[167]) { }
            column(GLDed168; GLDed[168]) { }
            column(GLDed169; GLDed[169]) { }
            column(GLDed170; GLDed[170]) { }
            column(GLDed171; GLDed[171]) { }
            column(GLDed172; GLDed[172]) { }
            column(GLDed173; GLDed[173]) { }
            column(GLDed174; GLDed[174]) { }
            column(GLDed175; GLDed[175]) { }
            column(GLDed176; GLDed[176]) { }
            column(GLDed177; GLDed[177]) { }
            column(GLDed178; GLDed[178]) { }
            column(GLDed179; GLDed[179]) { }
            column(GLDed180; GLDed[180]) { }
            column(GLDed181; GLDed[181]) { }
            column(GLDed182; GLDed[182]) { }
            column(GLDed183; GLDed[183]) { }
            column(GLDed184; GLDed[184]) { }
            column(GLDed185; GLDed[185]) { }
            column(GLDed186; GLDed[186]) { }
            column(GLDed187; GLDed[187]) { }
            column(GLDed188; GLDed[188]) { }
            column(GLDed189; GLDed[189]) { }
            column(GLDed190; GLDed[190]) { }
            column(GLDed191; GLDed[191]) { }
            column(GLDed192; GLDed[192]) { }
            column(GLDed193; GLDed[193]) { }
            column(GLDed194; GLDed[194]) { }
            column(GLDed195; GLDed[195]) { }
            column(GLDed196; GLDed[196]) { }
            column(GLDed197; GLDed[197]) { }
            column(GLDed198; GLDed[198]) { }
            column(GLDed199; GLDed[199]) { }
            column(GLDed200; GLDed[200]) { }
            column(GLDed201; GLDed[201]) { }
            column(GLDed202; GLDed[202]) { }
            column(GLDed203; GLDed[203]) { }
            column(GLDed204; GLDed[204]) { }
            column(GLDed205; GLDed[205]) { }
            column(GLDed206; GLDed[206]) { }
            column(GLDed207; GLDed[207]) { }
            column(GLDed208; GLDed[208]) { }
            column(GLDed209; GLDed[209]) { }
            column(GLDed210; GLDed[210]) { }
            column(GLDed211; GLDed[211]) { }
            column(GLDed212; GLDed[212]) { }
            column(GLDed213; GLDed[213]) { }
            column(GLDed214; GLDed[214]) { }
            column(GLDed215; GLDed[215]) { }
            column(GLDed216; GLDed[216]) { }
            column(GLDed217; GLDed[217]) { }
            column(GLDed218; GLDed[218]) { }
            column(GLDed219; GLDed[219]) { }
            column(GLDed220; GLDed[220]) { }
            column(GLDed221; GLDed[221]) { }
            column(GLDed222; GLDed[222]) { }
            column(GLDed223; GLDed[223]) { }
            column(GLDed224; GLDed[224]) { }
            column(GLDed225; GLDed[225]) { }
            column(GLDed226; GLDed[226]) { }
            column(GLDed227; GLDed[227]) { }
            column(GLDed228; GLDed[228]) { }
            column(GLDed229; GLDed[229]) { }
            column(GLDed230; GLDed[230]) { }
            column(GLDed231; GLDed[231]) { }
            column(GLDed232; GLDed[232]) { }
            column(GLDed233; GLDed[233]) { }
            column(GLDed234; GLDed[234]) { }
            column(GLDed235; GLDed[235]) { }
            column(GLDed236; GLDed[236]) { }
            column(GLDed237; GLDed[237]) { }
            column(GLDed238; GLDed[238]) { }
            column(GLDed239; GLDed[239]) { }
            column(GLDed240; GLDed[240]) { }
            column(GLDed241; GLDed[241]) { }
            column(GLDed242; GLDed[242]) { }
            column(GLDed243; GLDed[243]) { }
            column(GLDed244; GLDed[244]) { }
            column(GLDed245; GLDed[245]) { }
            column(GLDed246; GLDed[246]) { }
            column(GLDed247; GLDed[247]) { }
            column(GLDed248; GLDed[248]) { }
            column(GLDed249; GLDed[249]) { }
            column(GLDed250; GLDed[250]) { }
            column(GLDed251; GLDed[251]) { }
            column(GLDed252; GLDed[252]) { }
            column(GLDed253; GLDed[253]) { }
            column(GLDed254; GLDed[254]) { }
            column(GLDed255; GLDed[255]) { }
            column(GLDed256; GLDed[256]) { }
            column(GLDed257; GLDed[257]) { }
            column(GLDed258; GLDed[258]) { }
            column(GLDed259; GLDed[259]) { }
            column(GLDed260; GLDed[260]) { }
            column(GLDed261; GLDed[261]) { }
            column(GLDed262; GLDed[262]) { }
            column(GLDed263; GLDed[263]) { }
            column(GLDed264; GLDed[264]) { }
            column(GLDed265; GLDed[265]) { }
            column(GLDed266; GLDed[266]) { }
            column(GLDed267; GLDed[267]) { }
            column(GLDed268; GLDed[268]) { }
            column(GLDed269; GLDed[269]) { }
            column(GLDed270; GLDed[270]) { }
            column(GLDed271; GLDed[271]) { }
            column(GLDed272; GLDed[272]) { }
            column(GLDed273; GLDed[273]) { }
            column(GLDed274; GLDed[274]) { }
            column(GLDed275; GLDed[275]) { }
            column(GLDed276; GLDed[276]) { }
            column(GLDed277; GLDed[277]) { }
            column(GLDed278; GLDed[278]) { }
            column(GLDed279; GLDed[279]) { }
            column(GLDed280; GLDed[280]) { }
            column(GLDed281; GLDed[281]) { }
            column(GLDed282; GLDed[282]) { }
            column(GLDed283; GLDed[283]) { }
            column(GLDed284; GLDed[284]) { }
            column(GLDed285; GLDed[285]) { }
            column(GLDed286; GLDed[286]) { }
            column(GLDed287; GLDed[287]) { }
            column(GLDed288; GLDed[288]) { }
            column(GLDed289; GLDed[289]) { }
            column(GLDed290; GLDed[290]) { }
            column(GLDed291; GLDed[291]) { }
            column(GLDed292; GLDed[292]) { }
            column(GLDed293; GLDed[293]) { }
            column(GLDed294; GLDed[294]) { }
            column(GLDed295; GLDed[295]) { }
            column(GLDed296; GLDed[296]) { }
            column(GLDed297; GLDed[297]) { }
            column(GLDed298; GLDed[298]) { }
            column(GLDed299; GLDed[299]) { }
            column(GLDed300; GLDed[300]) { }
            column(GLDed301; GLDed[301]) { }
            column(GLDed302; GLDed[302]) { }
            column(GLDed303; GLDed[303]) { }
            column(GLDed304; GLDed[304]) { }
            column(GLDed305; GLDed[305]) { }
            column(GLDed306; GLDed[306]) { }
            column(GLDed307; GLDed[307]) { }
            column(GLDed308; GLDed[308]) { }
            column(GLDed309; GLDed[309]) { }
            column(GLDed310; GLDed[310]) { }
            column(GLDed311; GLDed[311]) { }
            column(GLDed312; GLDed[312]) { }
            column(GLDed313; GLDed[313]) { }
            column(GLDed314; GLDed[314]) { }
            column(GLDed315; GLDed[315]) { }
            column(GLDed316; GLDed[316]) { }
            column(GLDed317; GLDed[317]) { }
            column(GLDed318; GLDed[318]) { }
            column(GLDed319; GLDed[319]) { }
            column(GLDed320; GLDed[320]) { }
            column(GLDed321; GLDed[321]) { }
            column(GLDed322; GLDed[322]) { }
            column(GLDed323; GLDed[323]) { }
            column(GLDed324; GLDed[324]) { }
            column(GLDed325; GLDed[325]) { }
            column(GLDed326; GLDed[326]) { }
            column(GLDed327; GLDed[327]) { }
            column(GLDed328; GLDed[328]) { }
            column(GLDed329; GLDed[329]) { }
            column(GLDed330; GLDed[330]) { }
            column(GLDed331; GLDed[331]) { }
            column(GLDed332; GLDed[332]) { }
            column(GLDed333; GLDed[333]) { }
            column(GLDed334; GLDed[334]) { }
            column(GLDed335; GLDed[335]) { }
            column(GLDed336; GLDed[336]) { }
            column(GLDed337; GLDed[337]) { }
            column(GLDed338; GLDed[338]) { }
            column(GLDed339; GLDed[339]) { }
            column(GLDed340; GLDed[340]) { }
            column(GLDed341; GLDed[341]) { }
            column(GLDed342; GLDed[342]) { }
            column(GLDed343; GLDed[343]) { }
            column(GLDed344; GLDed[344]) { }
            column(GLDed345; GLDed[345]) { }
            column(GLDed346; GLDed[346]) { }
            column(GLDed347; GLDed[347]) { }
            column(GLDed348; GLDed[348]) { }
            column(GLDed349; GLDed[349]) { }
            column(GLDed350; GLDed[350]) { }
            column(GLDed351; GLDed[351]) { }
            column(GLDed352; GLDed[352]) { }
            column(GLDed353; GLDed[353]) { }
            column(GLDed354; GLDed[354]) { }
            column(GLDed355; GLDed[355]) { }
            column(GLDed356; GLDed[356]) { }
            column(GLDed357; GLDed[357]) { }
            column(GLDed358; GLDed[358]) { }
            column(GLDed359; GLDed[359]) { }
            column(GLDed360; GLDed[360]) { }
            column(GLDed361; GLDed[361]) { }
            column(GLDed362; GLDed[362]) { }
            column(GLDed363; GLDed[363]) { }
            column(GLDed364; GLDed[364]) { }
            column(GLDed365; GLDed[365]) { }
            column(GLDed366; GLDed[366]) { }
            column(GLDed367; GLDed[367]) { }
            column(GLDed368; GLDed[368]) { }
            column(GLDed369; GLDed[369]) { }
            column(GLDed370; GLDed[370]) { }
            column(GLDed371; GLDed[371]) { }
            column(GLDed372; GLDed[372]) { }
            column(GLDed373; GLDed[373]) { }
            column(GLDed374; GLDed[374]) { }
            column(GLDed375; GLDed[375]) { }
            column(GLDed376; GLDed[376]) { }
            column(GLDed377; GLDed[377]) { }
            column(GLDed378; GLDed[378]) { }
            column(GLDed379; GLDed[379]) { }
            column(GLDed380; GLDed[380]) { }
            column(GLDed381; GLDed[381]) { }
            column(GLDed382; GLDed[382]) { }
            column(GLDed383; GLDed[383]) { }
            column(GLDed384; GLDed[384]) { }
            column(GLDed385; GLDed[385]) { }
            column(GLDed386; GLDed[386]) { }
            column(GLDed387; GLDed[387]) { }
            column(GLDed388; GLDed[388]) { }
            column(GLDed389; GLDed[389]) { }
            column(GLDed390; GLDed[390]) { }
            column(GLDed391; GLDed[391]) { }
            column(GLDed392; GLDed[392]) { }
            column(GLDed393; GLDed[393]) { }
            column(GLDed394; GLDed[394]) { }
            column(GLDed395; GLDed[395]) { }
            column(GLDed396; GLDed[396]) { }
            column(GLDed397; GLDed[397]) { }
            column(GLDed398; GLDed[398]) { }
            column(GLDed399; GLDed[399]) { }
            column(GLDed400; GLDed[400]) { }
            trigger OnAfterGetRecord()
            begin

                Clear(rows);
                Clear(rows2);
                prPeriod_Transactions.Reset;
                prPeriod_Transactions.SetRange("Payroll Period", SelectedPeriod);
                prPeriod_Transactions.SetFilter("Group Order", '=1|3|4|7|8|9|0');
                //"prPeriod Transactions".SETFILTER("prPeriod Transactions"."Sub Group Order",'=2');
                //prPeriod_Transactions.SETFILTER("Posting Group", PostingGroupFilter);
                prPeriod_Transactions.SETFILTER("Transaction Type", '<>%1', prPeriod_Transactions."Transaction Type"::Benefit);
                prPeriod_Transactions.SetCurrentkey("Payroll Period", "Group Order", "Sub Group Order");
                if prPeriod_Transactions.Find('-') then begin
                    Clear(DetDate);
                    DetDate := Format("prPayroll Periods"."Period Name");
                    repeat
                    begin
                        if prPeriod_Transactions.Amount > 0 then begin
                            if ((prPeriod_Transactions."Group Order" = 4) and (prPeriod_Transactions."Sub Group Order" = 0)) then
                                GPY := GPY + prPeriod_Transactions.Amount;

                            if ((prPeriod_Transactions."Group Order" = 7) and
                            ((prPeriod_Transactions."Sub Group Order" = 3) or (prPeriod_Transactions."Sub Group Order" = 1) or
                             (prPeriod_Transactions."Sub Group Order" = 2) or (prPeriod_Transactions."Sub Group Order" = 4))) then
                                STAT := STAT + prPeriod_Transactions.Amount;

                            // if ((prPeriod_Transactions."Group Order" = 8) and (prPeriod_Transactions."Sub Group Order" <> 9)) and
                            //      ((prPeriod_Transactions."Sub Group Order" = 1) or (prPeriod_Transactions."Sub Group Order" = 0)) then
                            //     // if (prPeriod_Transactions."Transaction Type" = prPeriod_Transactions."Transaction Type"::Deduction) then
                            //     DED := DED + prPeriod_Transactions.Amount;

                            //  if ((prPeriod_Transactions."Group Order" = 9) and (prPeriod_Transactions."Sub Group Order" = 0)) then
                            if (prPeriod_Transactions."Transaction Code" = 'NPAY') then
                                NETS := NETS + prPeriod_Transactions.Amount;

                            if ((prPeriod_Transactions."Group Order" = 7) and (prPeriod_Transactions."Sub Group Order" = 4)) then
                                HLEVY := HLEVY + prPeriod_Transactions.Amount;



                            //TotalsAllowances:=TotalsAllowances+"prPeriod Transactions".Amount;
                            if ((prPeriod_Transactions."Group Order" = 1) or
                            (prPeriod_Transactions."Group Order" = 3) or
                             ((prPeriod_Transactions."Group Order" = 4) and (prPeriod_Transactions."Sub Group Order" <> 0))) then begin // A Payment  
                                Clear(countz);
                                // countz:=1;
                                Clear(found);
                                repeat
                                begin
                                    countz := countz + 1;
                                    if (PayTrans[countz]) = prPeriod_Transactions."Transaction Name" then found := true;
                                end;
                                until ((countz = (ArrayLen(PayTransAmt))) or ((PayTrans[countz]) = prPeriod_Transactions."Transaction Name")
                                or ((PayTrans[countz]) = ''));
                                rows := countz;
                                PayTrans[rows] := prPeriod_Transactions."Transaction Name";
                                PayTransAmt[rows] := PayTransAmt[rows] + prPeriod_Transactions.Amount;
                                if TransC.Get(prPeriod_Transactions."Transaction Code") then
                                    GLEarn[rows] := TransC."Pay Code";
                                PeriodTrans2.Reset();
                                PeriodTrans2.SetRange(PeriodTrans2."Transaction Code", prPeriod_Transactions."Transaction Code");
                                PeriodTrans2.SetRange(PeriodTrans2."Payroll Period", prPeriod_Transactions."Payroll Period");
                                if PeriodTrans2.find('-') then
                                    CountEarn[rows] := PeriodTrans2.Count;
                            end else
                                if (((prPeriod_Transactions."Group Order" = 7) and ((prPeriod_Transactions."Sub Group Order" <> 6)
                                  and (prPeriod_Transactions."Sub Group Order" <> 5))) or
                                  ((prPeriod_Transactions."Group Order" = 8) and (prPeriod_Transactions."Sub Group Order" <> 9))) then begin
                                    Clear(countz);
                                    // countz:=1;
                                    Clear(found);
                                    // prPeriod_Transactions.setcurrentkey("Transaction Name");
                                    repeat
                                    begin
                                        countz := countz + 1;
                                        if (DedTrans[countz]) = prPeriod_Transactions."Transaction Name" then found := true;
                                    end;
                                    until ((countz = (ArrayLen(DedTransAmt))) or ((DedTrans[countz]) = prPeriod_Transactions."Transaction Name")
                                    or ((DedTrans[countz]) = ''));
                                    rows := countz;
                                    DedTrans[rows] := prPeriod_Transactions."Transaction Name";
                                    DedTransAmt[rows] := DedTransAmt[rows] + prPeriod_Transactions.Amount;
                                    DED := DED + prPeriod_Transactions.Amount;
                                    if TransC.Get(prPeriod_Transactions."Transaction Code") then
                                        GLDed[rows] := TransC."Pay Code";
                                    PeriodTrans2.Reset();
                                    PeriodTrans2.SetRange(PeriodTrans2."Transaction Code", prPeriod_Transactions."Transaction Code");
                                    PeriodTrans2.SetRange(PeriodTrans2."Payroll Period", prPeriod_Transactions."Payroll Period");
                                    if PeriodTrans2.find('-') then
                                        CountDed[rows] := PeriodTrans2.Count;

                                end;
                            //end else
                            // if (prPeriod_Transactions.Amount < 0) and (prPeriod_Transactions."Transaction Code" = 'ALW-0055') then begin
                            //     countz := countz + 1;
                            //     rows := countz;
                            //     PayTrans[rows] := prPeriod_Transactions."Transaction Name";
                            //     PayTransAmt[rows] := prPeriod_Transactions.Amount;
                            //     GLEarn[rows] := prPeriod_Transactions."GL Account";

                        end;

                    end;
                    until prPeriod_Transactions.Next = 0;

                end;// End prPeriod_Transactions Repeat
                    // MESSAGE(' + eh'+FORMAT(r + ', ' + , '+FORMAT(rows2));
                TransC.Reset();
                TransC.SetRange(TransC."Transaction Type", TransC."Transaction Type"::Benefit);
                if TransC.Find('-') then begin
                    repeat
                        prPeriod_Transactions.Reset;
                        prPeriod_Transactions.SetRange("Payroll Period", SelectedPeriod);
                        prPeriod_Transactions.SetFilter("Group Order", '=1|3|4|7|8|9|0');
                        //"prPeriod Transactions".SETFILTER("prPeriod Transactions"."Sub Group Order",'=2');
                        //prPeriod_Transactions.SETFILTER("Posting Group", PostingGroupFilter);
                        prPeriod_Transactions.SETFILTER("Transaction Code", '%1', TransC."Transaction Code");
                        prPeriod_Transactions.SetCurrentkey("Payroll Period", "Group Order", "Sub Group Order");
                        if prPeriod_Transactions.Find('-') then begin
                            b := b + 1;
                            BenefitName[b] := prPeriod_Transactions."Transaction Name";
                            prPeriod_Transactions.CalcSums(Amount);
                            BenefitAmount[b] := prPeriod_Transactions.Amount;
                            BenefitTotal := BenefitTotal + prPeriod_Transactions.Amount;
                            BenefitNo[b] := prPeriod_Transactions.Count;
                            if TransC.Get(prPeriod_Transactions."Transaction Code") then
                                GLBen[b] := TransC."Pay Code";

                        end;
                    until TransC.Next = 0;
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                // if PostingGroup <> '' then PRPeriodTrans.SetRange("Posting Group", PostingGroup);
                if PRPeriodTrans.FindSet(false, false) then begin
                    NumberOfStaff := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::"Judicial Staff");
                if PRPeriodTrans.FindSet(false, false) then begin
                    JudicialStaff := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::"Judicial Officer");
                if PRPeriodTrans.FindSet(false, false) then begin
                    JudicialOfficer := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Casual);
                if PRPeriodTrans.FindSet(false, false) then begin
                    Casuals := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Temporary);
                if PRPeriodTrans.FindSet(false, false) then begin
                    Secondary := PRPeriodTrans.Count();
                end;
                PRPeriodTrans.Reset;
                PRPeriodTrans.SetCurrentkey("Employee Code", "Transaction Code", "Payroll Period");
                PRPeriodTrans.SetRange(PRPeriodTrans."Transaction Code", 'NPAY');
                PRPeriodTrans.SetRange(PRPeriodTrans."Payroll Period", PeriodFilter);
                PRPeriodTrans.SetRange(PRPeriodTrans."Employee Category Type", PRPeriodTrans."Employee Category Type"::Judge);
                if PRPeriodTrans.FindSet(false, false) then begin
                    Judges := PRPeriodTrans.Count();
                end;
                TransC.Reset();
                TransC.SetRange(TransC."Transaction Type", TransC."Transaction Type"::Deduction);
                if TransC.Find('-') then begin
                    repeat
                        PREmpDed.reset();
                        PREmpDed.SetCurrentkey("Transaction Code", "Payroll Period");
                        PREmpDed.SetRange(PREmpDed."Transaction Code", TransC."Transaction Code");
                        PREmpDed.SetRange(PREmpDed."Payroll Period", PeriodFilter);
                        If PREmpDed.FindSet(false, false) then begin
                            i := i + 1;
                            EmployerDeductionName[i] := TransC."Transaction Name";
                            PREmpDed.CalcSums(Amount);
                            EmployerDeductionAmount[i] := PREmpDed.Amount;
                            EmpDedNo[i] := PREmpDed.Count;
                            TotalEmployerDecuctions := TotalEmployerDecuctions + PREmpDed.Amount;

                        end;
                    until TransC.Next = 0;
                end;

            end;

            trigger OnPreDataItem()
            begin
                //LastFieldNo := FIELDNO("Period Year");
                PrintDate := CurrentDateTime;
                "prPayroll Periods".SetFilter("prPayroll Periods"."Date Opened", '=%1', SelectedPeriod);
            end;
        }
    }

    requestpage
    {

        layout
        {
            area(content)
            {
                field(periodfilter; PeriodFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Period Filter';
                    TableRelation = "pr Payroll Periods"."Date Opened";
                }
                field(PostingGroupFilter; PostingGroupFilter)
                {
                    ApplicationArea = Basic;
                    Caption = 'Posting Group Filter';
                    TableRelation = "pr Employee Posting Groups".Code;
                }
            }
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnInitReport()
    begin
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod.Closed, false);
        if objPeriod.Find('-') then;
        PeriodFilter := objPeriod."Date Opened";
    end;

    trigger OnPreReport()
    begin

        SelectedPeriod := PeriodFilter;
        objPeriod.Reset;
        objPeriod.SetRange(objPeriod."Date Opened", SelectedPeriod);
        if objPeriod.Find('-') then begin
            PeriodName := objPeriod."Period Name";
        end;


        if CompanyInfo.Get() then
            CompanyInfo.CalcFields(CompanyInfo.Picture);
        Clear(rows);
        Clear(GPY);
        Clear(STAT);
        Clear(DED);
        Clear(NETS);
        if UserRec.get(Userid) then
            GeneratedBy := UserRec."Employee Name";
    end;

    var
        DetDate: Text[100];
        found: Boolean;
        countz: Integer;
        PeriodFilter: Date;
        LastFieldNo: Integer;
        FooterPrinted: Boolean;
        PeriodTrans: Record "pr Period Transactions";
        PRPeriodTrans: Record "pr Period Transactions";
        PeriodTrans2: Record "pr Period Transactions";
        objPeriod: Record "pr Payroll Periods";
        SelectedPeriod: Date;
        PeriodName: Text[30];
        CompanyInfo: Record "Company Information";
        TotalsAllowances: Decimal;
        Dept: Boolean;
        PaymentDesc: Text[200];
        DeductionDesc: Text[200];
        GroupText1: Text[200];
        GroupText2: Text[200];
        PaymentAmount: Decimal;
        DeductAmount: Decimal;
        PayTrans: array[100] of Text[250];
        PayTransAmt: array[100] of Decimal;
        CountEarn: array[100] of Integer;
        DedTrans: array[500] of Text[250];
        DedTransAmt: array[500] of Decimal;
        CountDed: array[500] of Integer;
        rows: Integer;
        rows2: Integer;
        GPY: Decimal;
        NETS: Decimal;
        STAT: Decimal;
        DED: Decimal;
        TotalFor: label 'Total for ';
        GroupOrder: label '3';
        TransBal: array[2, 100] of Text[250];
        Addr: array[2, 10] of Text[250];
        RecordNo: Integer;
        NoOfColumns: Integer;
        ColumnNo: Integer;
        prPeriod_Transactions: Record "pr Period Transactions";
        PostingGroupFilter: code[20];
        HLEVY: Decimal;
        PrintDate: DateTime;
        NumberOfStaff: Integer;
        JudicialStaff: Integer;
        JudicialOfficer: Integer;
        Judges: Integer;
        Casuals: Integer;
        Secondary: Integer;
        GeneratedBy: Text;
        UserRec: Record "User Setup";
        EmployerDeductionName: array[100] of Text[250];
        EmployerDeductionAmount: array[500] of Decimal;
        TotalEmployerDecuctions: Decimal;
        PREmpDed: Record "PR Employer Deductions";
        TransC: Record "PR Transaction Codes";
        i: Integer;
        EmpDedNo: array[500] of Integer;
        BenefitName: array[500] of Text[250];
        BenefitAmount: array[500] of Decimal;
        BenefitTotal: Decimal;
        b: Integer;
        BenefitNo: array[500] of Integer;
        GLEarn: array[500] of Text[250];
        GLDed: array[500] of Text[250];
        GLBen: array[500] of Text[250];




}

