Table 52193948 "Travelling Employees1"
{

    fields
    {
        field(1;"Request No.";Code[20])
        {
            TableRelation = "Transport Request1";
        }
        field(2;"Employee No.";Code[10])
        {
            NotBlank = true;
            TableRelation = Employee;

            trigger OnValidate()
            begin
                if Emp.Get("Employee No.") then
                "Employee Name":=Emp."First Name"+' '+Emp."Middle Name"+' '+Emp."Last Name";
            end;
        }
        field(3;"Employee Name";Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Request No.","Employee No.")
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnDelete()
    begin
        TranReq.Reset;
        TranReq.SetRange(TranReq."Request No.","Request No.");
        TranReq.SetRange(TranReq.Status,TranReq.Status::Released);
        if TranReq.Find('-') then
          Error('You cannot Delete details from documents that have already been released');
    end;

    trigger OnInsert()
    begin
        TranReq.Reset;
        TranReq.SetRange(TranReq."Request No.","Request No.");
        TranReq.SetRange(TranReq.Status,TranReq.Status::Released);
        if TranReq.Find('-') then
          Error('You cannot edit documents that have already been released');
    end;

    trigger OnModify()
    begin
        TranReq.Reset;
        TranReq.SetRange(TranReq."Request No.","Request No.");
        TranReq.SetRange(TranReq.Status,TranReq.Status::Released);
        if TranReq.Find('-') then
          Error('You cannot edit documents that have already been released');
    end;

    var
        Emp: Record Employee;
        TranReq: Record "Transport Request1";
}

