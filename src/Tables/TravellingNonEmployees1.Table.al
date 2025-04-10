Table 52193952 "Travelling Non Employees1"
{

    fields
    {
        field(1;"Request No.";Code[20])
        {
            TableRelation = "Transport Request1";
        }
        field(2;"Line No";Integer)
        {
            AutoIncrement = false;
            NotBlank = true;
        }
        field(3;Name;Text[50])
        {
        }
    }

    keys
    {
        key(Key1;"Request No.","Line No")
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
          Error('You cannot delete details from documents that have already been released');
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

