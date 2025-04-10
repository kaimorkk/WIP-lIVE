Page 52193663 "SMS Types"
{
    PageType = List;
    SourceTable = "SMS Types";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(Type; Type)
                {
                    ApplicationArea = Basic;
                }
                field(MessageType; "Message Type")
                {
                    ApplicationArea = Basic;
                }
                field(SMSMESSAGE; "SMS MESSAGE")
                {
                    ApplicationArea = Basic;
                }
                field(Subject; Subject)
                {
                    ApplicationArea = Basic;
                }
                field(Activate; Activate)
                {
                    ApplicationArea = Basic;
                }
                field(StageFilter; "Stage Filter")
                {
                    ApplicationArea = Basic;
                }
                field(SenderName; "Sender Name")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
        area(navigation)
        {
            group(MailTemplates)
            {
                Caption = '&Mail Templates';
                Image = Template;
                group(ApprovalMailTemplate)
                {
                    Caption = 'Approval Mail Template';
                    Image = Template;
                    action(Import)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Import';
                        Ellipsis = true;
                        Image = Import;

                        trigger OnAction()
                        var
                            RBAutoMgt: Codeunit "File Management";
                            BLOBRef: Codeunit "Temp Blob";
                        begin
                            CalcFields(Template);
                            if Template.Hasvalue then
                                AppTemplateExists := true;

                            if RBAutoMgt.BLOBImport(BLOBRef, '*.HTM') = '' then
                                exit;

                            //Template := BLOBRef.Blob;

                            if AppTemplateExists then
                                if not Confirm(Text002, false, FieldCaption(Template)) then
                                    exit;
                            CurrPage.SaveRecord;
                        end;
                    }
                    action(Export)
                    {
                        ApplicationArea = Basic;
                        Caption = 'E&xport';
                        Ellipsis = true;
                        Image = Export;

                        trigger OnAction()
                        var
                            RBAutoMgt: Codeunit "File Management";
                            BLOBRef: Codeunit "Temp Blob";
                        begin
                            CalcFields(Template);
                            if Template.Hasvalue then begin
                                //BLOBRef.Blob := Template;
                                RBAutoMgt.BLOBExport(BLOBRef, '*.HTM', true);
                            end;
                        end;
                    }
                    action(Delete)
                    {
                        ApplicationArea = Basic;
                        Caption = 'Delete';
                        Ellipsis = true;
                        Image = Delete;

                        trigger OnAction()
                        begin
                            CalcFields(Template);
                            if Template.Hasvalue then
                                if Confirm(Text003, false, FieldCaption(Template)) then begin
                                    Clear(Template);
                                    CurrPage.SaveRecord;
                                end;
                        end;
                    }
                }
            }
        }
        area(Promoted)
        {
        }
    }

    var
        AppTemplateExists: Boolean;
        Text002: label 'Do you want to replace the existing template %1 %2?';
        Text003: label 'Do you want to delete the template %1?';
        Text004: label 'Do you want to run the overdue check by the %1?';
}

