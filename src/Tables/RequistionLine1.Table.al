Table 52193694 "Requistion Line1"
{
    // DrillDownPageID = "SubWorkPlan Activity Inputs";
    // LookupPageID = "SubWorkPlan Activity Inputs";

    fields
    {
        field(1;"Requistion No";Code[20])
        {

            trigger OnValidate()
            begin
                  /*
                   IF ReqHeader.GET("Requistion No") THEN BEGIN
                    IF ReqHeader."Global Dimension 1 Code"='' THEN
                       ERROR('Please Select the Department Requisitioning')
                  END;
                  */

            end;
        }
        field(3;"Line No.";Integer)
        {
            AutoIncrement = true;
            Caption = 'Line No.';
        }
        field(4;Type;Option)
        {
            Caption = 'Type';
            OptionCaption = ' ,G/L Account,Item';
            OptionMembers = " ","G/L Account",Item;
        }
        field(5;"No.";Code[20])
        {
            Caption = 'No.';
            TableRelation = if (Type=const("G/L Account")) "G/L Account"
                            else if (Type=const(Item)) Item;
                            

            trigger OnValidate()
            begin
                
                
                
                
                /*IF Type=Type::Item THEN BEGIN
                   IF QtyStore.GET("No.") THEN
                      QtyStore.CALCFIELDS(QtyStore.Inventory,QtyStore."Qty on Request");
                      "Qty in store":=QtyStore.Inventory-QtyStore."Qty on Request";
                      Description:=QtyStore.Description;
                      "Unit Price":=QtyStore."Unit Cost";
                      "Line Amount":="Unit Price"*Quantity;
                
                      {Modified}
                
                         //Validate Item
                      GLAccount.GET(QtyStore."Item G/L Budget Account");
                      GLAccount.CheckGLAcc;
                      GLAccount.TESTFIELD("Direct Posting",TRUE);
                
                      IF ReqHeader.GET("Requistion No") THEN BEGIN
                        EVALUATE(CurrMonth,FORMAT(DATE2DMY(ReqHeader."Request date",2)));
                        EVALUATE(CurrYR,FORMAT(DATE2DMY(ReqHeader."Request date",3)));
                        EVALUATE(BudgetDate,FORMAT('01'+'/'+CurrMonth+'/'+CurrYR));
                        //Get Last Day of the Month
                        LastDayofBud:=CALCDATE('1M',BudgetDate);
                        LastDayofBud:=CALCDATE('-1D',LastDayofBud);
                
                      END;
                
                
                        //Get Budget for the G/L
                      IF GenLedSetup.GET THEN BEGIN
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.",QtyStore."Item G/L Budget Account");
                        //GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                        {Get the exact Monthly Budget-filter from first date to Last Date of the Month to Enable get the Net Change in Month}
                        GLAccount.SETRANGE(GLAccount."Date Filter",BudgetDate,LastDayofBud);
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                         Budget:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                         "Current Month Budget":=Budget;
                        END;
                        //Get Budget for the Entire Budget Period
                        GLAccount.RESET;
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.",QtyStore."Item G/L Budget Account");
                        GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                          "Total Budget":=GLAccount."Budgeted Amount";
                        END;
                
                        //Get Budget Available upto the Current Month
                        GLAccount.RESET;
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.",QtyStore."Item G/L Budget Account");
                        GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",LastDayofBud);
                        GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                          AvailableAmount:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                        END;
                
                        //Get Commitments for that GL Account and deduct from Available amount.
                        CommitmentEntries.RESET;
                        CommitmentEntries.SETCURRENTKEY(CommitmentEntries.Account);
                        CommitmentEntries.SETRANGE(CommitmentEntries.Account,QtyStore."Item G/L Budget Account");
                        CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",LastDayofBud);
                        CommitmentEntries.CALCSUMS(CommitmentEntries."Committed Amount");
                        CommittedAmount:=CommitmentEntries."Committed Amount";
                        //Amount Available is Available amount MINUS Committed Amount
                        "Amount Available":=AvailableAmount-CommittedAmount;
                     END;
                
                
                END;
                
                IF Type=Type::"G/L Account" THEN BEGIN
                      GLAccount.GET("No.");
                      GLAccount.CheckGLAcc;
                      GLAccount.TESTFIELD("Direct Posting",TRUE);
                      Description := GLAccount.Name;
                
                      IF ReqHeader.GET("Requistion No") THEN BEGIN
                        EVALUATE(CurrMonth,FORMAT(DATE2DMY(ReqHeader."Request date",2)));
                        EVALUATE(CurrYR,FORMAT(DATE2DMY(ReqHeader."Request date",3)));
                        EVALUATE(BudgetDate,FORMAT('01'+'/'+CurrMonth+'/'+CurrYR));
                
                        //Get Last Day of the Month
                        LastDayofBud:=CALCDATE('1M',BudgetDate);
                        LastDayofBud:=CALCDATE('-1D',LastDayofBud);
                
                      END;
                
                        //Get Budget for the G/L
                      IF GenLedSetup.GET THEN BEGIN
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.","No.");
                        //GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",GenLedSetup."Current Budget End Date");
                        GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                        {Get the exact Monthly Budget}
                        GLAccount.SETRANGE(GLAccount."Date Filter",BudgetDate,LastDayofBud);
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                         Budget:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                         "Current Month Budget":=Budget;
                        END;
                        //Get Budget Available upto the Current Month
                        GLAccount.RESET;
                        GLAccount.SETFILTER(GLAccount."Budget Filter",GenLedSetup."Current Budget");
                        GLAccount.SETRANGE(GLAccount."No.","No.");
                        GLAccount.SETRANGE(GLAccount."Date Filter",GenLedSetup."Current Budget Start Date",LastDayofBud);
                        GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                        IF GLAccount.FIND('-') THEN BEGIN
                         GLAccount.CALCFIELDS(GLAccount."Budgeted Amount",GLAccount."Net Change");
                          "Total Budget":=GLAccount."Budgeted Amount";
                          AvailableAmount:=GLAccount."Budgeted Amount"-GLAccount."Net Change";
                        END;
                
                        //Get Commitments for that GL Account and deduct from Available amount.
                        CommitmentEntries.RESET;
                        CommitmentEntries.SETCURRENTKEY(CommitmentEntries.Account);
                        CommitmentEntries.SETRANGE(CommitmentEntries.Account,"No.");
                        CommitmentEntries.SETRANGE(CommitmentEntries."Commitment Date",GenLedSetup."Current Budget Start Date",LastDayofBud);
                        CommitmentEntries.CALCSUMS(CommitmentEntries."Committed Amount");
                        CommittedAmount:=CommitmentEntries."Committed Amount";
                        //Amount Available is Available amount MINUS Committed Amount
                        "Amount Available":=AvailableAmount-CommittedAmount;
                
                     END;
                END;  */

            end;
        }
        field(6;Description;Text[200])
        {
            Caption = 'Description';
        }
        field(7;"Description 2";Text[50])
        {
            Caption = 'Description 2';
        }
        field(8;Quantity;Decimal)
        {
            Caption = 'Quantity';
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                /*IF Type=Type::Item THEN BEGIN
                   IF QtyStore.GET("No.") THEN
                      QtyStore.CALCFIELDS(QtyStore.Inventory,QtyStore."Qty on Request");
                      "Qty in store":=QtyStore.Inventory-QtyStore."Qty on Request";
                      Description:=QtyStore.Description;
                      "Line Amount":="Unit Price"*Quantity;
                END; */

            end;
        }
        field(9;"Qty in store";Decimal)
        {
            DecimalPlaces = 0:0;
            FieldClass = Normal;

            trigger OnValidate()
            begin
                 if Type=Type::Item then
                   "Line Amount":="Unit Price"*Quantity;
            end;
        }
        field(10;"Request Status";Option)
        {
            Editable = true;
            OptionMembers = Open,Released,Approved,Closed,Rejected;
        }
        field(11;"Action Type";Option)
        {
            OptionMembers = " ",Issue,"Ask for Quote";

            trigger OnValidate()
            begin
                     if Type=Type::"G/L Account" then begin
                        if "Action Type"="action type"::Issue then
                                 Error('You cannot Issue a G/L Account please order for it')
                     end;


                    //Compare Quantity in Store and Qty to Issue
                     if Type=Type::Item then begin
                        if "Action Type"="action type"::Issue then begin
                         if Quantity>"Qty in store" then
                           Error('You cannot Issue More than what is available in store')
                        end;
                     end;
            end;
        }
        field(12;"Unit of Measure";Code[20])
        {
            TableRelation = "Unit of Measure";
        }
        field(13;"Total Budget";Decimal)
        {
        }
        field(14;"Current Month Budget";Decimal)
        {
        }
        field(15;"Unit Price";Decimal)
        {

            trigger OnValidate()
            begin
                  if Type=Type::Item then
                   "Line Amount":="Unit Price"*Quantity;
            end;
        }
        field(16;"Line Amount";Decimal)
        {
            DecimalPlaces = 0:5;
        }
        field(17;"Amount Available";Decimal)
        {
        }
        field(18;"Quantity Requisitioned";Decimal)
        {
            DecimalPlaces = 0:5;

            trigger OnValidate()
            begin
                       Quantity:="Quantity Requisitioned";
                       Validate(Quantity);
            end;
        }
        field(19;Select;Boolean)
        {
        }
    }

    keys
    {
        key(Key1;"Requistion No","Line No.")
        {
            Clustered = true;
        }
        key(Key2;"No.",Type,"Request Status")
        {
            SumIndexFields = Quantity;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
          if "Request Status"<>"request status"::Open then
              Error('You Cannot Delete Entries Once Released for Approval')
    end;

    trigger OnInsert()
    begin
           "Line Amount":="Unit Price"*Quantity;
    end;

    trigger OnModify()
    begin
          if Type=Type::Item then
           "Line Amount":="Unit Price"*Quantity;
    end;

    var
        GLAccount: Record "G/L Account";
        GenLedSetup: Record "General Ledger Setup";
        QtyStore: Record Item;
        GenPostGroup: Record "General Posting Setup";
        Budget: Decimal;
        CurrMonth: Code[10];
        CurrYR: Code[10];
        BudgDate: Text[30];
        ReqHeader: Record "Requisition Header1";
        BudgetDate: Date;
        YrBudget: Decimal;
        LastDayofBud: Date;
        AvailableAmount: Decimal;
        CommittedAmount: Decimal;
}

