
table 59029 "Fuel Travel Requisition"
{
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Req No"; Code[20])
        {

            // trigger OnValidate()
            // begin
            //     DwTicket.Reset;
            //     DwTicket.SetRange(DwTicket."Transport Requisition No", Rec."Req No");
            //     if DwTicket.FindFirst then begin
            //         ImprestMemo.Reset;
            //         ImprestMemo.SetRange(ImprestMemo."No.", DwTicket."Approved Imprest Memo");
            //         if ImprestMemo.FindFirst then begin
            //             "Job No" := ImprestMemo.Job;
            //             "Job Task" := ImprestMemo."Job  Task";
            //             "Job Name" := ImprestMemo."Job Name";
            //             "Job Task Name" := ImprestMemo."Job Task Name";
            //         end;
            //     end;

            //     ImprestMemo.Reset;
            //     ImprestMemo.SetRange(ImprestMemo."No.", DwTicket."Approved Imprest Memo");
            //     if ImprestMemo.FindFirst then begin
            //         "Job No" := ImprestMemo.Job;
            //         "Job Task" := ImprestMemo."Job  Task";
            //         "Job Name" := ImprestMemo."Job Name";
            //         "Job Task Name" := ImprestMemo."Job Task Name";
            //     end;
            // end;
        }
        field(2; "Project No"; Code[10])
        {
        }
        field(3; "Job No"; Code[10])
        {
            TableRelation = Job."No.";

            trigger OnValidate()
            begin
                if job.Get("Job No") then
                    "Job Name" := job.Description;
            end;
        }
        field(4; "Job Task"; Code[10])
        {
            TableRelation = "Job Task"."Job Task No." where("Job No." = field("Job No"));

            trigger OnValidate()
            begin
                JobTask.Reset;
                JobTask.SetRange("Job Task No.", JobTask."Job Task No.");
                if JobTask.FindFirst then
                    "Job Task Name" := JobTask.Description;
            end;
        }
        field(5; "Requested Amount"; Decimal)
        {
        }
        field(6; EntryNo; Integer)
        {
            AutoIncrement = true;
        }
        field(7; "Phone Number"; Integer)
        {
        }
        field(8; "Allocated Vehicle Reg No"; Code[30])
        {
            TableRelation = "Fleet Vehicles."."Registration No.";
        }
        field(26; "Expense Type"; Option)
        {
            OptionCaption = 'Fuel,Maintenance';
            OptionMembers = Fuel,Maintenance;
        }
        field(27; "Job Name"; Text[100])
        {
        }
        field(28; "Job Task Name"; Text[100])
        {
        }
    }

    keys
    {
        key(Key1; "Req No", EntryNo)
        {
            Clustered = true;
        }
    }

    fieldgroups
    {
    }

    trigger OnInsert()
    begin
        Validate("Req No");
    end;

    trigger OnModify()
    begin
        Validate("Req No");
    end;

    trigger OnRename()
    begin
        Validate("Req No");
    end;

    var
        HrEmployee: Record Employee;
        DwTicket: Record "Transport Requisition";
        // ImprestMemo: Record "Imprest Memo";
        job: Record Job;
        JobTask: Record "Job Task";
}

