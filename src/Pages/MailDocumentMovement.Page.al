Page 52193843 "Mail/Document Movement"
{
    PageType = Card;
    SourceTable = "Mail/Document Movement1";

    layout
    {
        area(content)
        {
            group(General)
            {
                Caption = 'General';
                field(MovementCode; "Movement Code")
                {
                    ApplicationArea = Basic;
                }
                field(Document; Document)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(DocumentDescription; "Document Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Mail; Mail)
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(MailDescription; "Mail Description")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReceiverType; "Receiver Type")
                {
                    ApplicationArea = Basic;

                    trigger OnValidate()
                    begin
                        if "Receiver Type" = "receiver type"::Employee then begin
                            "Vendor NoEditable" := false;
                            "Customer NoEditable" := false;
                            "Employee No.Editable" := true;
                        end else if "Receiver Type" = "receiver type"::Vendor then begin
                            "Employee No.Editable" := false;
                            "Customer NoEditable" := false;
                            "Vendor NoEditable" := true;
                        end else if "Receiver Type" = "receiver type"::Customer then begin
                            "Employee No.Editable" := false;
                            "Vendor NoEditable" := false;
                            "Customer NoEditable" := true;
                        end;
                        ReceiverTypeOnAfterValidate;
                    end;
                }
                field(Employee; "Employee No.")
                {
                    ApplicationArea = Basic;
                    Caption = 'Employee';
                    Editable = "Employee No.Editable";
                }
                field(EmployeeName; "Employee Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Vendor; "Vendor No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Vendor ';
                    Editable = "Vendor NoEditable";
                }
                field(VendorName; "Vendor Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Customer; "Customer No")
                {
                    ApplicationArea = Basic;
                    Caption = 'Customer';
                    Editable = "Customer NoEditable";
                }
                field(CustomerName; "Customer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Date; Date)
                {
                    ApplicationArea = Basic;
                }
                field(Time; Time)
                {
                    ApplicationArea = Basic;
                }
                field(Issuer; Issuer)
                {
                    ApplicationArea = Basic;
                    Editable = true;
                }
                field(IssuerName; "Issuer Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(Issued; "Issued?")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(CompleteIssue)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Issue';

                trigger OnAction()
                begin
                    TestField(Date);
                    TestField(Time);
                    TestField(Issuer);

                    if "Issued?" = true then
                        Error('Mail/Document Already Issued.Please Confirm!!');

                    "Issued?" := true;
                    Modify;
                    if Mail <> '' then begin
                        Mails.Get(Mail);
                        Mails."Available in Registry?" := false;
                        Mails.Modify;

                        Message('Mail Issued Successfully');
                    end else begin
                        Doc.Get(Document, File, Volume);
                        Doc."Available In Registry?" := false;
                        Doc.Modify;
                        Message('Document Issued Successfully');

                    end;
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteIssue_Promoted; CompleteIssue)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        "Employee No.Editable" := true;
        "Customer NoEditable" := true;
        "Vendor NoEditable" := true;
    end;

    var
        Mails: Record Mails1;
        Doc: Record "Document Management1";

        "Vendor NoEditable": Boolean;

        "Customer NoEditable": Boolean;

        "Employee No.Editable": Boolean;

    local procedure ReceiverTypeOnAfterValidate()
    begin
        if "Receiver Type" = "receiver type"::Employee then begin
            "Vendor NoEditable" := false;
            "Customer NoEditable" := false;
            "Employee No.Editable" := true;
        end else if "Receiver Type" = "receiver type"::Vendor then begin
            "Employee No.Editable" := false;
            "Customer NoEditable" := false;
            "Vendor NoEditable" := true;
        end else if "Receiver Type" = "receiver type"::Customer then begin
            "Employee No.Editable" := false;
            "Vendor NoEditable" := false;
            "Customer NoEditable" := true;
        end;
    end;
}

