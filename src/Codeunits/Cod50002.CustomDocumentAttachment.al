codeunit 50002 "Custom Document Attachment"
{
    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Factbox", 'OnBeforeDrillDown', '', false, false)]
    local procedure SpecifyTheCustomTableOnBeforeDrillDown(DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        //Bid Tabulation Header
        BidTabulation: Record "Bid Tabulation Header";
        //Licence Registration Form
        LicenceRegForm: Record "Licence Registration Form";
        //Staff Establishment Plan
        StaffEstablishmentPlan: Record "Staff Establishment Plan";
        //Licensing Portal Users
        LicencePortalUsers: Record "Licensing Portal Users";
        //Leave Jnl
        LeaveJnl: Record "Leave Journal Voucher";
        //Emp Exit Header
        ExitHeader: Record "Employee Exit header";
        //Candidate Interview Record
        CandidateInterviewRecord: Record "Candidate Interview Record";
        //Employee Qualification
        EmployeeQualification: Record "Employee Qualification";
        //Imprests
        Imprests: Record "Request Header1";
        //Applicant
        Applicant: Record Applicant;
        //Job Applications
        JobApplications: Record "Job Applications";
    begin
        case
            DocumentAttachment."Table ID" of
                Database::"Bid Tabulation Header":
                    begin
                        RecRef.Open(Database::"Bid Tabulation Header");
                        if BidTabulation.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(BidTabulation);
                    end;

                Database::"Licensing Portal Users":
                    begin
                        RecRef.Open(Database::"Licensing Portal Users");
                        if LicencePortalUsers.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(LicencePortalUsers);
                    end;

                Database::"Licence Registration Form":
                    begin
                        RecRef.Open(Database::"Licence Registration Form");
                        if LicenceRegForm.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(LicenceRegForm);
                    end;

                Database::"Staff Establishment Plan":
                    begin
                        RecRef.Open(Database::"Staff Establishment Plan");
                        if StaffEstablishmentPlan.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(StaffEstablishmentPlan);
                    end;
                Database::"Leave Journal Voucher":
                    begin
                        RecRef.Open(Database::"Leave Journal Voucher");
                        if LeaveJnl.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(LeaveJnl);
                    end;

                Database::"Employee Exit header":
                    begin
                        RecRef.Open(Database::"Employee Exit header");
                        if ExitHeader.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(ExitHeader);
                    end;
                Database::"Candidate Interview Record":
                    begin
                        RecRef.Open(Database::"Candidate Interview Record");
                        if CandidateInterviewRecord.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(CandidateInterviewRecord);
                    end;
                Database::"Employee Qualification":
                    begin
                        RecRef.Open(Database::"Employee Qualification");
                        EmployeeQualification.Reset();
                        EmployeeQualification.SetRange("Employee No.", DocumentAttachment."No.");
                        EmployeeQualification.SetRange("Line No.", DocumentAttachment."Line No.");
                        if EmployeeQualification.FindFirst() then
                            RecRef.GetTable(EmployeeQualification);
                    end;
                Database::"Request Header1":
                    begin
                        RecRef.Open(Database::"Request Header1");
                        if Imprests.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(Imprests);
                    end;
                Database::"Applicant":
                    begin
                        RecRef.Open(Database::"Applicant");
                        Applicant.Reset();
                        if Applicant.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(Applicant);
                    end;
                Database::"Job Applications":
                    begin
                        RecRef.Open(Database::"Job Applications");
                        if JobApplications.Get(DocumentAttachment."No.") then
                            RecRef.GetTable(JobApplications);
                    end;
        end;
    end;

    [EventSubscriber(ObjectType::Page, Page::"Document Attachment Details", 'OnAfterOpenForRecRef', '', false, false)]
    local procedure SpecifyTheFieldAssociatedOnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef; var FlowFieldsEditable: Boolean)
    var
        FRef: FieldRef;
        RecNo: Code[20];
        FRef1: FieldRef;
        RecNo1: Integer;
    begin
        case RecRef.Number of

            Database::"Bid Tabulation Header":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"Licensing Portal Users":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"Licence Registration Form":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"Staff Establishment Plan":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            
            Database::"Leave Journal Voucher":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;

            Database::"Employee Exit header":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Candidate Interview Record":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Employee Qualification":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                    FRef1 := RecRef.Field(2);
                    RecNo1 := FRef1.Value;
                    DocumentAttachment.SetRange("Line No.", RecNo1);
                end;
            Database::"Request Header1":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Job Applications":
                begin
                    FRef := RecRef.Field(48);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
            Database::"Applicant":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.SetRange("No.", RecNo);
                end;
        end;
    end;

    [EventSubscriber(ObjectType::Table, Database::"Document Attachment", 'OnAfterInitFieldsFromRecRef', '', false, false)]
    local procedure UpdatePrimaryKeyOnAfterInitFieldsFromRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    var
        FRef: FieldRef;
        RecNo: Code[20];
        FRef1: FieldRef;
        RecNo1: Integer;
    begin
        case RecRef.Number of

            Database::"Bid Tabulation Header":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Licensing Portal Users":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Licence Registration Form":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Staff Establishment Plan":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Leave Journal Voucher":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;

            Database::"Employee Exit header":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Candidate Interview Record":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Employee Qualification":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                    FRef1 := RecRef.Field(2);
                    RecNo1 := FRef1.Value;
                    DocumentAttachment.Validate("Line No.", RecNo1);
                end;
            Database::"Request Header1":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Applicant":
                begin
                    FRef := RecRef.Field(1);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
            Database::"Job Applications":
                begin
                    FRef := RecRef.Field(48);
                    RecNo := FRef.Value;
                    DocumentAttachment.Validate("No.", RecNo);
                end;
        end;
    end;

}
