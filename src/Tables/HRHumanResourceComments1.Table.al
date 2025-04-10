Table 52193764 "HR Human Resource Comments1"
{

    fields
    {
        field(1;"Table Name";Option)
        {
            OptionMembers = Employee,Relative,"Relation Management","Correspondence History",Images,"Absence and Holiday","Cost to Company","Pay History","Bank Details",Maternity,"SAQA Training History","Absence Information","Incident Report","Emp History","Medical History","Career History",Appraisal,Disciplinary,"Exit Interviews",Grievances,"Existing Qualifications","Proffesional Membership","Education Assistance","Learning Intervention","NOSA or other Training","Company Skills Plan","Development Plan","Skills Plan","Emp Salary",Unions;
        }
        field(2;"No.";Code[20])
        {
            // TableRelation = if ("Table Name"=const(Employee)) "HR Employee1"."No."
            //                 else if ("Table Name"=const(Relative)) Table52008.Field1
            //                 else if ("Table Name"=const("Relation Management")) Table52011.Field1
            //                 else if ("Table Name"=const("Correspondence History")) Table52014.Field1
            //                 else if ("Table Name"=const(Images)) Table52015.Field1
            //                 else if ("Table Name"=const("Absence and Holiday")) Table52019.Field1
            //                 else if ("Table Name"=const("Cost to Company")) Table52021.Field1
            //                 else if ("Table Name"=const("Bank Details")) Table52022.Field1
            //                 else if ("Table Name"=const(Maternity)) Table52025.Field1
            //                 else if ("Table Name"=const("SAQA Training History")) Table52026.Field1
            //                 else if ("Table Name"=const("Absence Information")) Table52035.Field1;
        }
        field(3;"Table Line No.";Integer)
        {
        }
        field(4;"Key Date";Date)
        {
        }
        field(6;"Line No.";Integer)
        {
        }
        field(7;Date;Date)
        {
        }
        field(8;"Code";Code[10])
        {
        }
        field(9;Comment;Text[80])
        {
        }
        field(10;User;Text[30])
        {
        }
    }

    keys
    {
        key(Key1;"No.","Table Name","Table Line No.")
        {
            Clustered = true;
        }
        
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    var
        lRec_UserTable: Record "User Setup";
    begin
        lRec_UserTable.Get(UserId);
        //User := ;
        Date := WorkDate;
    end;

    trigger OnModify()
    var
        lRec_UserTable: Record "User Setup";
    begin
        lRec_UserTable.Get(UserId);
        //User := lRec_UserTable.Name;
        Date := WorkDate;
    end;


    procedure SetUpNewLine()
    var
        HumanResCommentLine: Record "HR Human Resource Comments1";
    begin
        HumanResCommentLine := Rec;
        HumanResCommentLine.SetRecfilter;
        HumanResCommentLine.SetRange("Line No.");
        if not HumanResCommentLine.Find('-') then
          Date := WorkDate;
    end;
}

