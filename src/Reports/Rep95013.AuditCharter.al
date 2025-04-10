report 95013 "Audit Charter"
{
    DefaultLayout = RDLC;
    RDLCLayout = './Layouts/Audit Charter.rdlc';

    dataset
    {
        dataitem("Internal Audit Charter"; "Internal Audit Charter")
        {
            column(COMPANY; CompanyInfo.Name)
            {
            }
            column(logo; CompanyInfo.Picture)
            {
            }
            column(PostCode; CompanyInfo."Post Code")
            {
            }
            column(City; CompanyInfo.City)
            {
            }
            column(Address; CompanyInfo.Address)
            {
            }
            column(Address2; CompanyInfo."Address 2")
            {
            }
            column(Code_InternalAuditCharter; "Internal Audit Charter".Code)
            {
            }
            column(Description_InternalAuditCharter; "Internal Audit Charter".Description)
            {
            }
            column(ExternalDocumentNo_InternalAuditCharter; "Internal Audit Charter"."External Document No.")
            {
            }
            column(EffectiveDate_InternalAuditCharter; "Internal Audit Charter"."Effective Date")
            {
            }
            column(Overview_InternalAuditCharter; "Internal Audit Charter".Overview)
            {
            }
            column(CAEID_InternalAuditCharter; "Internal Audit Charter"."CAE ID")
            {
            }
            column(CAEJobTitle_InternalAuditCharter; "Internal Audit Charter"."CAE Name")
            {
            }
            column(CAEDirectlyReportsTo_InternalAuditCharter; "Internal Audit Charter"."CAE Directly Reports-To")
            {
            }
            column(CAEIndirectlyReportsTo_InternalAuditCharter; "Internal Audit Charter"."CAE Indirectly Reports-To")
            {
            }
            column(ApprovedBy_InternalAuditCharter; "Internal Audit Charter"."Approved By")
            {
            }
            dataitem("Audit Charter Component"; "Audit Charter Component")
            {
                DataItemLink = "Audit Charter ID" = field(Code);
                column(AuditCharterID_AuditCharterComponent; "Audit Charter Component"."Audit Charter ID")
                {
                }
                column(ComponentType_AuditCharterComponent; "Audit Charter Component"."Component Type")
                {
                }
                column(LineNo_AuditCharterComponent; "Audit Charter Component"."Line No.")
                {
                }
                column(Description_AuditCharterComponent; "Audit Charter Component".Description)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }

    labels
    {
    }

    trigger OnPreReport()
    begin
        CompanyInfo.Get;
        CompanyInfo.CalcFields(Picture);
    end;

    var
        CompanyInfo: Record "Company Information";
}

