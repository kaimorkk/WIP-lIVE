Page 52193846 "Mail/Document Movement2"
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
                field(Receiver; Receiver)
                {
                    ApplicationArea = Basic;
                }
                field(ReceiverName; "Receiver Name")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                }
                field(ReceivingDate; "Receiving Date")
                {
                    ApplicationArea = Basic;
                }
                field(ReceivingTime; "Receiving Time")
                {
                    ApplicationArea = Basic;
                }
                field(Received; "Received?")
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
            action(CompleteReceiving)
            {
                ApplicationArea = Basic;
                Caption = 'Complete Receiving';

                trigger OnAction()
                begin
                    TestField(Receiver);
                    TestField("Receiving Date");
                    TestField("Receiving Time");

                    if "Received?" = true then
                        Error('Mail/Document Already Received.Please Confirm!!');

                    "Received?" := true;
                    Modify;
                    if Mail <> '' then begin
                        Mails.Get(Mail);
                        Mails."Available in Registry?" := true;
                        Mails.Modify;

                        Message('Mail Received Successfully');
                    end else begin
                        Doc.Get(Document, File, Volume);
                        Doc."Available In Registry?" := true;
                        Doc.Modify;
                        Message('Document Received Successfully');

                    end;
                    // }
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(CompleteReceiving_Promoted; CompleteReceiving)
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

