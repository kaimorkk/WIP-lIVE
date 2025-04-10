Table 52193530 "Expenditure Authority"
{
    DrillDownPageID = "Expenditure Authority";
    LookupPageID = "Expenditure Authority";

    fields
    {
        field(1;"No.";Code[10])
        {
        }
        field(2;"Date Created";Date)
        {
        }
        field(3;"Vote Holder User ID";Code[15])
        {
        }
        field(6;"Vote Title";Integer)
        {
            TableRelation = "Acc. Schedule Line"."Line No." where ("Schedule Name"=const('VOTEBOOK'));

            trigger OnValidate()
            begin
                AccSchedLine.Reset;
                AccSchedLine.SetRange(AccSchedLine."Schedule Name",'VOTEBOOK');
                AccSchedLine.SetRange(AccSchedLine."Line No.","Vote Title");
                if AccSchedLine.Find('-') then begin
                   GenSetup.Get();

                   "Vote Title Name" := AccSchedLine.Description;
                   GLAccount.Reset;
                   GLAccount.SetFilter(GLAccount."No.",AccSchedLine.Totaling);
                   FisrtDateOfYear := Dmy2date(1,1,Date2dmy("Date Created",3));
                   GLAccount.SetFilter(GLAccount."Date Filter",Format(FisrtDateOfYear)+'..'+Format("Date Created"));
                   "Cumm. Expenditure YTD" := 0;
                   if GLAccount.Find('-') then begin
                    repeat
                      GLAccount.CalcFields(GLAccount."Net Change");
                      "Cumm. Expenditure YTD" := "Cumm. Expenditure YTD" + GLAccount."Net Change";
                    until GLAccount.Next = 0;
                   end;

                   LastDateThisYear := Dmy2date(31,12,Date2dmy("Date Created",3));
                   FisrtDateOfYear := Dmy2date(1,1,Date2dmy("Date Created",3));
                   "Annual Budget" := 0;

                   GLAccount.Reset;
                   GLAccount.SetFilter(GLAccount."No.",AccSchedLine.Totaling);
                   GLAccount.SetFilter(GLAccount."Date Filter",Format(FisrtDateOfYear)+'..'+Format(LastDateThisYear));
                   GLAccount.SetFilter(GLAccount."Budget Filter",GenSetup."Current Budget");
                   if GLAccount.Find('-') then begin
                     repeat
                       GLAccount.CalcFields(GLAccount."Budgeted Amount");
                       "Annual Budget" := "Annual Budget" + GLAccount."Budgeted Amount";
                     until GLAccount.Next = 0;
                   end;

                   "Month Budget Provision" := "Annual Budget" /12;

                   "Cumm. Monthly Budget Before" := ("Month Budget Provision" * Date2dmy("Date Created",2)) -
                                                    ("Cumm. Expenditure YTD");

                    "Cumm. Monthly Budget After" := "Cumm. Monthly Budget Before" - "Requeted Expenditure";
                    "Annual Budget Balance" :="Annual Budget" - "Cumm. Expenditure YTD" ;
                end;

                //Get already commited funds
                AIE.Reset;
                AIE.SetCurrentkey(AIE."Vote Title",AIE.Approved,AIE.Commitment,AIE."Date Created");
                AIE.SetRange(AIE."Vote Title","Vote Title");
                AIE.SetRange(AIE.Approved,true);
                AIE.SetRange(AIE.Commitment,true);
                if AIE.Find('-') then begin
                  AIE.CalcSums(AIE."Requeted Expenditure");
                  "Commited Funds" := AIE."Requeted Expenditure";
                end else
                  "Commited Funds" := 0;
            end;
        }
        field(7;"Vote Title Name";Text[50])
        {
        }
        field(8;"Annual Budget";Decimal)
        {
        }
        field(9;"Month Budget Provision";Decimal)
        {
        }
        field(10;"Requeted Expenditure";Decimal)
        {

            trigger OnValidate()
            begin
                if "Vote Title Name" = '' then
                  Error('You must first specify the vote title');

                if ("Requeted Expenditure" + "Commited Funds") > "Annual Budget Balance" then
                  Error('Requested expenditure amount cannot be more than the annual budget balance');

                "Cumm. Monthly Budget After" := "Cumm. Monthly Budget Before" - "Requeted Expenditure";
                 "Annual Budget Balance" :="Annual Budget" - "Cumm. Expenditure YTD" -  "Requeted Expenditure";
            end;
        }
        field(11;"Reasons For Expenditure";Text[60])
        {
        }
        field(12;"Budget Controller ID";Code[15])
        {
        }
        field(13;"Budget Controller Name";Text[50])
        {
        }
        field(14;"Cumm. Monthly Budget Before";Decimal)
        {
        }
        field(15;"Cumm. Monthly Budget After";Decimal)
        {
        }
        field(16;"Cumm. Expenditure YTD";Decimal)
        {
        }
        field(17;"Annual Budget Balance";Decimal)
        {
        }
        field(18;"Vote Holder Name";Text[50])
        {
        }
        field(19;"No. Series";Code[10])
        {
        }
        field(20;Approved;Boolean)
        {
        }
        field(21;Commitment;Boolean)
        {
        }
        field(22;"Commited Funds";Decimal)
        {
        }
    }

    keys
    {
        key(Key1;"No.")
        {
            Clustered = true;
        }
        key(Key2;"Vote Title",Approved,Commitment,"Date Created")
        {
            SumIndexFields = "Requeted Expenditure";
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        if "No." = '' then begin
          NoSeriesMgt.InitSeries('EXPAUTH',xRec."No. Series",0D,"No.","No. Series");
        end;

        "Date Created" := Today;
        "Vote Holder User ID" := UserId;

        if UsersRec.Get(UserId) then
          "Vote Holder Name" := UsersRec."User Name";
    end;

    var
        AccSchedLine: Record "Acc. Schedule Line";
        UsersRec: Record User;
        GLAccount: Record "G/L Account";
        FisrtDateOfYear: Date;
        GenSetup: Record "General Set-Up";
        FirstDateThisMonth: Date;
        LastDateThisMonth: Date;
        LastDateThisYear: Date;
        NoSeriesMgt: Codeunit NoSeriesManagement;
        AIE: Record "Expenditure Authority";
}

