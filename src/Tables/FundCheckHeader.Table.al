Table 52194074 "Fund Check Header"
{

    fields
    {
        field(1;Period;Date)
        {
            Editable = false;
        }
        field(2;Description;Text[100])
        {
        }
        field(3;Status;Option)
        {
            OptionCaption = 'Open,Pending Approval,Approved,Rejected';
            OptionMembers = Open,"Pending Approval",Approved,Rejected;
        }
        field(4;"User ID";Code[20])
        {
        }
    }

    keys
    {
        key(Key1;Period)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
           AcctPeriod.Reset;
           AcctPeriod.SetRange(AcctPeriod."Starting Date",0D,Today);
           AcctPeriod.SetRange(AcctPeriod."New Fiscal Year",true);
           if AcctPeriod.Find('+') then
           begin
             Period:=AcctPeriod."Starting Date";

            // "Policy Expiry Date":=CALCDATE('1Y',AcctPeriod."Starting Date")-1;
          end;
         "User ID":=UserId;
    end;

    var
        AcctPeriod: Record "Accounting Period";
}

