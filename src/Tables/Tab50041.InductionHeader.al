table 50041 "Induction Header"
{
    Caption = 'Induction Header';
    DataClassification = ToBeClassified;

    fields
    {
        field(1; "No."; Code[20])
        {
            Caption = 'No.';
        }
        field(2; "Document Date"; Date)
        {
            Caption = 'Document Date';
        }
        field(3; "Job Grade"; Code[20])
        {
            Caption = 'Job Grade';
        }
        field(4; "Created By"; Code[20])
        {
            Caption = 'Created By';
        }
        field(5; "Approval Status"; Option)
        {
            Caption = 'Approval Status';
            OptionCaption = 'Open,Pending Approval,Released,Rejected,Closed';
            OptionMembers = Open,"Pending Approval",Released,Rejected,Closed;
            trigger OnValidate()
            var
                Email: Codeunit Email;
                EmailMessage: Codeunit "Email Message";
                Body: Text;
                Recipient: List of [Text];
                Resource: Record Resource;
                Emp: Record Employee;
                Attendees: record "Induction Lines";
                Facilitators: Record "Induction Curriculum";
                Instr: InStream;
                Outstr: OutStream;
                TempBlob: Codeunit "Temp Blob";
                RecRef: RecordRef;

            begin
                if "Approval Status" = "Approval Status"::Released then begin
                    //Notify Attendees
                    Body := 'Dear All,<BR> This is to notify you that your induction training has been approved. <BR>' +
                     'Induction start date: ' + format("Start Date") + '<BR>Induction End date: ' + Format("End Date") + '<BR>Venue: ' + Format(Venue);

                    Attendees.Reset();
                    Attendees.SetRange("Induction No.", "No.");
                    if Attendees.FindSet() then
                        repeat
                            if (Emp.Get(Attendees."Employee No.")) and (Emp."Company E-Mail" <> '') then
                                Recipient.Add(Emp."Company E-Mail");

                        until Attendees.Next() = 0;
                    EmailMessage.Create(Recipient, 'Orientation/Induction Training', Body, true);
                    RecRef.GetTable(Rec);
                    TempBlob.CreateOutStream(OutStr);
                    // Report.SaveAs(Report::"Employee Induction Form", '', ReportFormat::Pdf, OutStr, RecRef);
                    TempBlob.CreateInStream(InStr);
                    EmailMessage.AddAttachment('Employee Induction Form', 'PDF', InStr);

                    Email.Send(EmailMessage);

                    //Notify facilitators
                    Facilitators.Reset();
                    Facilitators.SetRange("Induction No.", "No.");
                    if Facilitators.FindSet() then
                        repeat
                            Clear(Recipient);
                            // if (Resource.Get(Facilitators.Facilitator)) and (Resource."E-mail Address" <> '') then begin
                            //     Recipient.Add(Resource."E-mail Address");
                            //     Body := 'Dear ' + Facilitators."Facilitator Name" + ',<BR> This is to notify you that you have been selected as a facilitator for the induction training with the below details. <BR>' +
                            //                                          'Objective: ' + Facilitators.Objective +
                            //                                          '<BR>Induction start date: ' + format("Start Date") +
                            //                                          '<BR>Induction End date: ' + Format("End Date") +
                            //                                          '<BR>Venue: ' + Format(Venue);
                            //     EmailMessage.Create(Recipient, 'Orientation/Induction Training', Body, true);
                            //     Email.Send(EmailMessage);

                            // end;
                        until Facilitators.Next() = 0;


                end;

            end;
        }
        field(6; "Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(7; "End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(8; Venue; Text[100])
        {
            DataClassification = ToBeClassified;
        }
        field(9; "No. Series"; Code[30])
        {
            DataClassification = ToBeClassified;
        }
        field(10; Workplan; Code[50])
        {
            DataClassification = ToBeClassified;
            TableRelation = "Annual Strategy Workplan";
        }
        field(11; "Budget Line"; Code[20])
        {
            DataClassification = ToBeClassified;
            TableRelation = "G/L Account"."No.";

            trigger OnValidate()
            var
                Budget: Record "G/L Budget Entry";
                CMS: Record "Cash Management Setup";
            begin
                CMS.Get();
                Budget.Reset();
                Budget.SetRange("Budget Name", CMS."Current Budget");
                Budget.SetRange("G/L Account No.", "Budget Line");
                Budget.CalcSums(Amount);
                "Budgeted Amount" := Budget.Amount;
            end;
        }
        field(12; "Budgeted Amount"; Decimal)
        {
            DataClassification = ToBeClassified;

        }
        field(13; "Available Budget"; Decimal)
        {
            DataClassification = ToBeClassified;
        }
        field(14; MyField; Blob)
        {
            DataClassification = ToBeClassified;
        }
        field(15; "Global Dimension 1 Code"; Code[20])
        {
            CaptionClass = '1,1,1';
            Caption = 'Global Dimension 1 Code';
            TableRelation = "Dimension Value".Code where("Global Dimension No." = const(1));
        }
        field(16; "Cost Center Name"; Text[50])
        {
            FieldClass = FlowField;
            CalcFormula = lookup("Dimension Value".Name where(Code = field("Global Dimension 1 Code"), "Global Dimension No." = const(1)));
        }

        field(17; "Employment Start Date"; Date)
        {
            DataClassification = ToBeClassified;
        }
        field(18; "Employment End Date"; Date)
        {
            DataClassification = ToBeClassified;
        }


    }
    keys
    {
        key(PK; "No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    begin
        HSetup.Get();
        HSetup.TestField(HSetup."Induction Nos");
        if "No." = '' then
            NoSeriesMgt.InitSeries(HSetup."Induction Nos", xRec."No. Series", 0D, "No.", "No. Series");

        "Created By" := userid;
        "Document Date" := today;

    end;

    trigger OnDelete()
    var
        InductionLines: record "Induction Lines";
        Curriculum: Record "Induction Curriculum";
    begin
        InductionLines.Reset();
        InductionLines.SetRange("Induction No.", "No.");
        if InductionLines.findset() then
            InductionLines.DeleteAll();
        Curriculum.Reset();
        Curriculum.SetRange("Induction No.", "No.");
        if Curriculum.FindSet() then
            Curriculum.DeleteAll();

    end;

    var
        HSetup: Record "Human Resources Setup";
        NoSeriesMgt: Codeunit NoSeriesManagement;
}
