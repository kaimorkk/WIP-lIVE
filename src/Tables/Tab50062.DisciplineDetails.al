table 50062 "Discipline Details"
{
    Caption = 'Discipline Details';
    DataClassification = CustomerContent;

    fields
    {
        field(1; "Discipline Detail No."; Code[20])
        {
            Caption = 'Discipline Detail No.';
            Editable = false;
        }
        field(2; "Discipline Case No."; Code[20])
        {
            TableRelation = "HR Disciplinary Cases"."Case Number";
            Caption = 'Discipline Case No.';
            Editable = false;
        }
        field(3; "Document Stage"; Code[50])
        {
            Caption = 'Document Stage';
            TableRelation = "Discipline Document Stage";
            trigger OnValidate()
            var
                DisciplineDocStage: Record "Discipline Document Stage";
                StageNo: Integer;
                PreviousStageNo: Integer;
                DispDcStg: Record "Discipline Document Stage";
                DisciplineDtls: Record "Discipline Details";
                EntryFound: Boolean;
                ErrorEntry: Label 'An entry for stage %1, should first be keyed in before proceeding';

            begin
                DisciplineDocStage.Reset();
                DisciplineDocStage.SetRange(Code, "Document Stage");
                if DisciplineDocStage.FindFirst() then begin
                    "Document Stage Description" := DisciplineDocStage.Description;
                    StageNo := DisciplineDocStage."Stage No.";
                    PreviousStageNo := StageNo - 1;
                    if PreviousStageNo > 0 then begin
                        EntryFound := false;
                        DispDcStg.Reset;
                        DispDcStg.SetRange("Stage No.", PreviousStageNo);
                        if DispDcStg.FindSet then
                            repeat
                                DisciplineDtls.Reset();
                                DisciplineDtls.SetRange("Discipline Case No.", Rec."Discipline Case No.");
                                DisciplineDtls.SetRange("Document Stage", DispDcStg.Code);
                                EntryFound := DisciplineDtls.FindFirst();
                            until (DispDcStg.Next() = 0) or (EntryFound = true);
                        if not EntryFound then
                            Error(ErrorEntry, PreviousStageNo);
                    end;
                end;

            end;
        }
        field(4; "Document Stage Description"; Text[250])
        {
            Caption = 'Document Stage Description';
            Editable = false;

        }
        field(5; Recommendations; Text[1000])
        {
            Caption = 'Recommendations';
        }
        field(6; "Chief Justice Remarks"; Text[1000])
        {
            Caption = 'Chief Justice Remarks';
            trigger OnValidate()
            var
                DisciplineDocStage: Record "Discipline Document Stage";
            begin
                Rec.TestField(Recommendations);
                DisciplineDocStage.Reset();
                DisciplineDocStage.SetRange(DisciplineDocStage.Code, "Document Stage");
                if DisciplineDocStage.FindFirst() then begin
                    DisciplineDocStage.TestField("Requires CJ Remarks", true);
                end;
            end;
        }
        field(7; Status; Option)
        {
            OptionMembers = Open,Pending,Approved,Rejected;
            Editable = false;
        }
        field(8; "Stage Completed"; Boolean)
        {
            Editable = false;
        }
        field(9; "Completed By"; Code[50])
        {
            Editable = false;

        }
        field(10; "Completed On"; DateTime)
        {
            Editable = false;

        }
        field(12; "Email Notification Sent"; Boolean)
        {
            Editable = false;

        }
        field(13; "Email Notification Sent On"; DateTime)
        {
            Editable = false;
        }
        field(14; "Email Notification Sent By"; Code[50])
        {
            Editable = false;
        }
        field(15; "Next Email Date"; Date)
        {
            Editable = false;
        }
        field(16; "Effective Date"; Date)
        {
        }
        field(17; "Employee No."; Code[50])
        {
            Editable = false;
        }
        field(18; "Employee Name"; Text[100])
        {
            Editable = false;
        }
    }

    keys
    {
        key(PK; "Discipline Detail No.", "Discipline Case No.")
        {
            Clustered = true;
        }
    }

    trigger OnInsert()
    var
        DisciplineDtls: Record "Discipline Details";
        CompleteStage: Label 'Please mark stage %1 as completed before opening a new stage';
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
    begin

        HRDisciplinaryCases.Reset;
        HRDisciplinaryCases.SetRange(HRDisciplinaryCases.Status, HRDisciplinaryCases.Status::Submitted);
        HRDisciplinaryCases.SetRange(HRDisciplinaryCases."Case Number", Rec."Discipline Case No.");
        HRDisciplinaryCases.FindFirst();

        "Employee No." := HRDisciplinaryCases."Employee No";
        "Employee Name" := HRDisciplinaryCases."Employee Name";

        DisciplineDtls.Reset();
        DisciplineDtls.SetRange("Discipline Case No.", Rec."Discipline Case No.");
        DisciplineDtls.SetRange("Stage Completed", false);
        if DisciplineDtls.FindLast() then
            Error(CompleteStage, DisciplineDtls."Document Stage" + ' : ' + DisciplineDtls."Document Stage Description");
    end;

    procedure MarkAsCompleted()
    var
        DisciplineDocStage: Record "Discipline Document Stage";

    begin
        if not Confirm('Sure to mark the stage as completed?') then exit;

        Rec.TestField(Status, Rec.Status::Approved);

        Rec.TestField("Stage Completed", false);
        Rec.TestField("Document Stage");
        Rec.TestField(Recommendations);

        DisciplineDocStage.Reset();
        DisciplineDocStage.SetRange(Code, Rec."Document Stage");
        if DisciplineDocStage.FindFirst() then begin
            if DisciplineDocStage."Requires CJ Remarks" then
                Rec.TestField("Chief Justice Remarks");
            if DisciplineDocStage."Requires Email Notification" then
                Rec.TestField("Email Notification Sent", true);
        end;

        Rec."Stage Completed" := true;
        Rec."Completed By" := UserId;
        Rec."Completed On" := CurrentDateTime;
        Rec.Modify();

        Message('The stage has been marked as completed successfully!');
    end;

    procedure CloseCase()
    var
        HRDisciplinaryCases: Record "HR Disciplinary Cases";

    begin
        Rec.TestField("Stage Completed", true);


        HRDisciplinaryCases.Reset();
        HRDisciplinaryCases.SetRange("Case Number", Rec."Discipline Case No.");
        HRDisciplinaryCases.FindFirst();
        HRDisciplinaryCases.Status := HRDisciplinaryCases.Status::Closed;
        HRDisciplinaryCases."Closed By" := UserId;
        HRDisciplinaryCases.Modify(true);

        Message('The case  has been marked as closed successfully!');


    end;

    procedure SendEmailNotification()
    var
        DisciplineDocStage: Record "Discipline Document Stage";
        // VehicleMgt: Codeunit "Vehicle Management";
        InStr: InStream;
        EmailSent: Label 'Email notification sent successfully!';
        EmailToSend: Label '<h3>Employee Details</h3><div><b>Name:</b>%1</div><div><b>Payroll Number:</b>%2</div><h3>Case Details</h3><div><b>Case No:</b>%3</div><div><b>Case Description:</b>%4</div><div><b>Recommendation:</b>%5</div>';
        EmailRecepient: Text;
        EmailCc: Text;
        EmailSubject: Text;
        Employee: Record Employee;
        EmailBody: Text;
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
        DisciplineDtls: Record "Discipline Details";
        OutStr: OutStream;
        TempBlob: Codeunit "Temp Blob";
        RecRef: RecordRef;
        AttachmentFileName: Text;
        BlankDateFormulae: DateFormula;
        showCauseEmailSubject: Label 'NOTICE TO SHOW CAUSE';
        ShowCauseEmailBody: Label 'Please find attached the notice to show cause';

    begin
        Rec.TestField(Status, Rec.Status::Approved);
        Rec.TestField("Document Stage");
        Rec.TestField(Recommendations);
        AttachmentFileName := '';
        DisciplineDocStage.Reset();
        DisciplineDocStage.SetRange(Code, Rec."Document Stage");
        if DisciplineDocStage.FindFirst() then begin

            EmailSubject := 'Discipline ' + "Document Stage Description";

            GetAcCusedEmployeeRecord().TestField("E-Mail");

            DisciplineDocStage.TestField("Requires Email Notification", true);
            if DisciplineDocStage."Requires CJ Remarks" then
                Rec.TestField("Chief Justice Remarks");
            if DisciplineDocStage."Attachment Type" <> DisciplineDocStage."Attachment Type"::" " then begin
                //DisciplineDocStage."Attachment Type"::
            end;

            if DisciplineDocStage."Email To" in [DisciplineDocStage."Email To"::"Disciplinary Team",
            DisciplineDocStage."Email To"::"Disciplinary Team & Accused"] then begin
                // DisciplineDocStage.TestField("Email Recepient");
                GetDisciplinaryTeamLeadEmployeeRecord.TestField("E-Mail");
                EmailRecepient := GetDisciplinaryTeamLeadEmployeeRecord."E-Mail";
                if DisciplineDocStage."Email To" = DisciplineDocStage."Email To"::"Disciplinary Team & Accused" then
                    EmailRecepient += ';' + GetAccusedEmployeeRecord()."E-Mail";
            end;

            if DisciplineDocStage."Email To" = DisciplineDocStage."Email To"::"Accused Employee" then
                EmailRecepient := GetAccusedEmployeeRecord()."E-Mail";

            HRDisciplinaryCases.Reset();
            HRDisciplinaryCases.SetRange("Case Number", Rec."Discipline Case No.");
            HRDisciplinaryCases.FindFirst();


            EmailBody := StrSubstNo(EmailToSend, GetAcCusedEmployeeRecord().FullName(), GetAccusedEmployeeRecord()."No.",
            HRDisciplinaryCases."Case Number", HRDisciplinaryCases."Case Description", Recommendations);

            TempBlob.CreateOutStream(OutStr);

            case DisciplineDocStage."Attachment Type" of
                DisciplineDocStage."Attachment Type"::"Show Cause Letter":
                    begin
                        DisciplineDtls.Reset();
                        DisciplineDtls.SetRange("Discipline Detail No.", Rec."Discipline Detail No.");
                        if DisciplineDtls.FindFirst() then begin
                            RecRef.GetTable(DisciplineDtls);
                            // Report.SaveAs(Report::"Show Cause Letter", '', ReportFormat::Pdf, OutStr, RecRef);
                            TempBlob.CreateInStream(InStr);
                            AttachmentFileName := 'ShowCause_' + DisciplineDtls."Discipline Case No." + '.pdf';
                            EmailSubject := showCauseEmailSubject;
                            EmailBody := ShowCauseEmailBody;
                        end;
                    end;
                DisciplineDocStage."Attachment Type"::"Charging Letter":
                    begin
                        DisciplineDtls.Reset();
                        DisciplineDtls.SetRange("Discipline Detail No.", Rec."Discipline Detail No.");
                        if DisciplineDtls.FindFirst() then begin
                            RecRef.GetTable(DisciplineDtls);
                            // Report.SaveAs(Report::"Statement of Charge", '', ReportFormat::Pdf, OutStr, RecRef);
                            TempBlob.CreateInStream(InStr);
                            AttachmentFileName := 'StatementOfCharge_' + DisciplineDtls."Discipline Case No." + '.pdf';
                            EmailSubject := showCauseEmailSubject;
                            EmailBody := ShowCauseEmailBody;
                        end;
                    end;
                DisciplineDocStage."Attachment Type"::Interdiction:
                    begin
                        DisciplineDtls.Reset();
                        DisciplineDtls.SetRange("Discipline Detail No.", Rec."Discipline Detail No.");
                        if DisciplineDtls.FindFirst() then begin
                            RecRef.GetTable(DisciplineDtls);
                            // Report.SaveAs(Report::Interdiction, '', ReportFormat::Pdf, OutStr, RecRef);
                            TempBlob.CreateInStream(InStr);
                            AttachmentFileName := 'Interdiction_' + DisciplineDtls."Discipline Case No." + '.pdf';
                            EmailSubject := showCauseEmailSubject;
                            EmailBody := ShowCauseEmailBody;
                        end;
                    end;
            end;

        //     VehicleMgt.SendEmail(EmailRecepient, EmailCc, EmailSubject, 'Greetings,', EmailBody,
        // AttachmentFileName, InStr);

            Rec."Email Notification Sent" := true;
            Rec."Email Notification Sent By" := UserId;
            Rec."Email Notification Sent On" := CurrentDateTime;
            if DisciplineDocStage."Email Reminder Period" <> BlankDateFormulae then
                Rec."Next Email Date" := CalcDate(DisciplineDocStage."Email Reminder Period", Today);

            Rec.Modify();
            Message('Email Notification sent');
        end;
    end;

    procedure GetAccusedEmployeeRecord() Employee: Record Employee;
    var
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
    begin
        HRDisciplinaryCases.ReSet();
        HRDisciplinaryCases.SetRange("Case Number", Rec."Discipline Case No.");
        HRDisciplinaryCases.FindFirst();
        Employee.Get(HRDisciplinaryCases."Employee No");
    end;



    procedure GetDisciplinaryTeamLeadEmployeeRecord() Employee: Record Employee;
    var
        HRDisciplinaryCases: Record "HR Disciplinary Cases";
    begin
        HRDisciplinaryCases.ReSet();
        HRDisciplinaryCases.SetRange("Case Number", Rec."Discipline Case No.");
        HRDisciplinaryCases.FindFirst();
        HRDisciplinaryCases.TestField("Disciplinary Officer In Charge");
        Employee.Get(HRDisciplinaryCases."Disciplinary Officer In Charge");
    end;

}
