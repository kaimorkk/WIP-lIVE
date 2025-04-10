Table 52193853 "Employee PGroups1"
{

    fields
    {
        field(1;"Posting Group";Code[10])
        {
            TableRelation = "Employee Posting GroupX1";
        }
        field(2;"Code";Code[10])
        {
            TableRelation = if (Type=const(Earning)) EarningsX1
                            else if (Type=const(Deduction)) DeductionsX1;

            trigger OnValidate()
            begin
                  if Type=Type::Earning then
                  begin
                  if EarningRec.Get(Code) then
                  begin
                  Description:=EarningRec.Description;
                  end;
                  end;

                  if Type=Type::Deduction then
                  begin
                  if Deduction.Get(Code) then
                  begin
                  Description:=Deduction.Description;
                  end;
                  end;
            end;
        }
        field(3;"G/L Account";Code[10])
        {
            TableRelation = "G/L Account";
        }
        field(4;Description;Text[30])
        {
        }
        field(5;Type;Option)
        {
            OptionMembers = Earning,Deduction;
        }
        field(6;"GL Account Employer";Code[10])
        {
            TableRelation = "G/L Account";
        }
    }

    keys
    {
        key(Key1;"Posting Group","Code",Type)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    var
        EarningRec: Record EarningsX1;
        Deduction: Record DeductionsX1;
}

