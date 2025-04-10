

page 95347 "Aud Document Attachment"
{
    Caption = 'Attached Documents';
    DelayedInsert = true;
    Editable = true;
    PageType = Worksheet;
    SourceTable = "Document Attachment";
    SourceTableView = sorting(ID, "Table ID");

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = Basic;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(Name; Rec."File Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the filename of the attachment.';

                    // trigger OnDrillDown()
                    // var
                    //     TempBlob: Record TempBlob;
                    //     FileManagement: Codeunit "File Management";
                    //     FileName: Text;
                    // begin
                    //     if "Document Reference ID".Hasvalue then
                    //         Export(true)
                    //     else begin
                    //         FileName := FileManagement.BLOBImportWithFilter(TempBlob, ImportTxt, FileName, StrSubstNo(FileDialogTxt, FilterTxt), FilterTxt);
                    //         if FileName <> '' then
                    //             SaveAttachment(FromRecRef, FileName, TempBlob);
                    //         CurrPage.Update(false);
                    //     end;
                    // end;
                }
                field("File Extension"; Rec."File Extension")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the file extension of the attachment.';
                }
                field("File Type"; Rec."File Type")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the type of document that the attachment is.';
                }
                field(User; Rec.User)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the user who attached the document.';
                }
                field("Attached Date"; Rec."Attached Date")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the date when the document was attached.';
                }
                field("Document Flow Purchase"; Rec."Document Flow Purchase")
                {
                    ApplicationArea = All;
                    CaptionClass = GetCaptionClass(9);
                    Editable = FlowFieldsEditable;
                    ToolTip = 'Specifies if the attachment must flow to transactions.';
                    Visible = PurchaseDocumentFlow;
                }
                field("Document Flow Sales"; Rec."Document Flow Sales")
                {
                    ApplicationArea = All;
                    CaptionClass = GetCaptionClass(11);
                    Editable = FlowFieldsEditable;
                    ToolTip = 'Specifies if the attachment must flow to transactions.';
                    Visible = SalesDocumentFlow;
                }
            }
        }
    }

    actions
    {
        area(processing)
        {
            action(Preview)
            {
                ApplicationArea = All;
                Caption = 'Preview';
                Image = Export;
                Scope = Repeater;
                ToolTip = 'Get a preview of the attachment.';

                // trigger OnAction()
                // begin
                //     if "File Name" <> '' then
                //         Export(true);
                // end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    trigger OnInit()
    begin
        FlowFieldsEditable := true;
    end;

    trigger OnNewRecord(BelowxRec: Boolean)
    begin
        Rec."File Name" := SelectFileTxt;
    end;

    var
        FromRecRef: RecordRef;
        SalesDocumentFlow: Boolean;
        FileDialogTxt: label 'Attachments (%1)|%1', Comment = '%1=file types, such as *.txt or *.docx';
        FilterTxt: label '*.jpg;*.jpeg;*.bmp;*.png;*.gif;*.tiff;*.tif;*.pdf;*.docx;*.doc;*.xlsx;*.xls;*.pptx;*.ppt;*.msg;*.xml;*.*', Locked = true;
        ImportTxt: label 'Attach a document.';
        SelectFileTxt: label 'Select File...';
        PurchaseDocumentFlow: Boolean;
        FlowToPurchTxt: label 'Flow to Purch. Trx';
        FlowToSalesTxt: label 'Flow to Sales Trx';
        FlowFieldsEditable: Boolean;

    local procedure GetCaptionClass(FieldNo: Integer): Text
    begin
        if SalesDocumentFlow and PurchaseDocumentFlow then
            case FieldNo of
                9:
                    exit(FlowToPurchTxt);
                11:
                    exit(FlowToSalesTxt);
            end;
    end;

    procedure OpenForRecRef(RecRef: RecordRef)
    var
        FieldRef: FieldRef;
        RecNo: Code[20];
        DocType: Option Quote,"Order",Invoice,"Credit Memo","Blanket Order","Return Order";
        LineNo: Integer;
    begin
        Rec.Reset;

        FromRecRef := RecRef;
        Rec.SetRange("Table ID", RecRef.Number);

        if RecRef.Number = Database::Item then begin
            SalesDocumentFlow := true;
            PurchaseDocumentFlow := true;
        end;

        case RecRef.Number of
            Database::Customer,
          Database::"Sales Header",
          Database::"Sales Line",
          Database::"Sales Invoice Header",
          Database::"Sales Invoice Line",
          Database::"Sales Cr.Memo Header",
          Database::"Sales Cr.Memo Line":
                SalesDocumentFlow := true;
            Database::Vendor,
          Database::"Purchase Header",
          Database::"Purchase Line",
          Database::"Purch. Inv. Header",
          Database::"Purch. Inv. Line",
          Database::"Procurement Request",
          Database::"Purch. Cr. Memo Hdr.",
          //Added Custom document by Morris
        //   Database::"Grant Funding Application",
        //   Database::"Case Register",
          //End Custom document Morris
          Database::"Purch. Cr. Memo Line":
                PurchaseDocumentFlow := true;
        end;

        case RecRef.Number of
            Database::Customer,
            Database::Vendor,
            Database::Item,
            Database::Employee,
            Database::"Fixed Asset",
            Database::Job,
            Database::"Procurement Request",
            //Added Custom document by Morris
            // Database::"Grant Funding Application",
            Database::Payments,
            // Database::"Case Register",
            //End Custom document Morris
            Database::Resource:
                begin
                    FieldRef := RecRef.Field(1);
                    RecNo := FieldRef.Value;
                    Rec.SetRange("No.", RecNo);
                end;
        end;
        // case RecRef.Number of
        //     Database::"Fuel & Maintenance Requisition":
        //         begin
        //             FieldRef := RecRef.Field(1);
        //             RecNo := FieldRef.Value;
        //             Rec.SetRange("No.", RecNo);
        //         end;
        // end;

        case RecRef.Number of
            Database::"Sales Header",
            Database::"Sales Line",
            Database::"Purchase Header",
            Database::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(1);
                    DocType := FieldRef.Value;
                    Rec.SetRange("Document Type", DocType);

                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    Rec.SetRange("No.", RecNo);

                    FlowFieldsEditable := false;
                end;
        end;

        case RecRef.Number of
            Database::"Sales Line",
            Database::"Purchase Line":
                begin
                    FieldRef := RecRef.Field(4);
                    LineNo := FieldRef.Value;
                    Rec.SetRange("Line No.", LineNo);
                end;
        end;

        case RecRef.Number of
            Database::"Sales Invoice Header",
            Database::"Sales Cr.Memo Header",
            Database::"Purch. Inv. Header",
            Database::"Purch. Cr. Memo Hdr.":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    Rec.SetRange("No.", RecNo);

                    FlowFieldsEditable := false;
                end;
        end;

        case RecRef.Number of
            Database::"Sales Invoice Line",
            Database::"Sales Cr.Memo Line",
            Database::"Purch. Inv. Line",
            Database::"Purch. Cr. Memo Line":
                begin
                    FieldRef := RecRef.Field(3);
                    RecNo := FieldRef.Value;
                    Rec.SetRange("No.", RecNo);

                    FieldRef := RecRef.Field(4);
                    LineNo := FieldRef.Value;
                    Rec.SetRange("Line No.", LineNo);

                    FlowFieldsEditable := false;
                end;
        end;

        OnAfterOpenForRecRef(Rec, RecRef);
    end;

    [IntegrationEvent(false, false)]
    local procedure OnAfterOpenForRecRef(var DocumentAttachment: Record "Document Attachment"; var RecRef: RecordRef)
    begin
    end;
}

#pragma implicitwith restore

