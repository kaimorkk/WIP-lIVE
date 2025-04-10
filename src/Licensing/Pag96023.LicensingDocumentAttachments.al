page 96023 "Licensing Document Attachments"
{
    ApplicationArea = All;
    Caption = 'Licensing Document Attachments';
    PageType = List;
    SourceTable = "Document Attachment";
    UsageCategory = None;
    InsertAllowed = false;
    Editable = false;
    ModifyAllowed = false;
    // SourceTableView = where("Table ID" = const(Database::"Licensing Portal Users"));
    
    layout
    {
        area(Content)
        {
            repeater(General)
            {
                field("No."; Rec."No.")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the No. field.';
                }
                field(ID; Rec.ID)
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the value of the ID field.', Comment = '%';
                }
                field(Name; Rec."File Name")
                {
                    ApplicationArea = All;
                    Editable = false;
                    ToolTip = 'Specifies the filename of the attachment.';

                    trigger OnDrillDown()
                    var
                        Selection: Integer;
                    begin
                        if Rec.HasContent() then
                            Rec.Export(true)
                    end;
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
                field("Document Type"; Rec."Document Type")
                {
                    ApplicationArea = All;
                    ToolTip = 'Specifies the value of the Document Type field.', Comment = '%';
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
                    Editable = false;
                    ToolTip = 'Specifies the date when the document was attached.';
                }
                field("Table ID"; Rec."Table ID")
                {
                    ApplicationArea = Basic;
                    Visible = false;
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
                Caption = 'Download';
                Image = Download;
                Enabled = DownloadEnabled;
                Scope = Repeater;
                ToolTip = 'Download the file to your device. Depending on the file, you will need an app to view or edit the file.';

                trigger OnAction()
                begin
                    if Rec."File Name" <> '' then
                        Rec.Export(true);
                end;
            }
        }
        area(Promoted)
        {
            group(Category_Process)
            {
                Caption = 'Process', Comment = 'Generated from the PromotedActionCategories property index 1.';

                actionref(Preview_Promoted; Preview)
                {
                }
            }
        }
    }

    trigger OnAfterGetCurrRecord()
    var
        SelectedDocumentAttachment: Record "Document Attachment";
        DocumentSharing: Codeunit "Document Sharing";
    begin
        CurrPage.SetSelectionFilter(SelectedDocumentAttachment);
        IsMultiSelect := SelectedDocumentAttachment.Count() > 1;
        DownloadEnabled := Rec.HasContent() and (not IsMultiSelect);
    end;

    var
        DownloadEnabled: Boolean;
        IsMultiSelect: Boolean;
}

