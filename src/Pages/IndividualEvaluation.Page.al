Page 52194412 "Individual Evaluation"
{
    PageType = List;
    SourceTable = "Individual Evaluation";

    layout
    {
        area(content)
        {
            repeater(Group)
            {
                field(EvaluatorCode;"Evaluator Code")
                {
                    ApplicationArea = Basic;
                }
                field(EvaluatorName;"Evaluator Name")
                {
                    ApplicationArea = Basic;
                }
                field(Vendor;Vendor)
                {
                    ApplicationArea = Basic;
                }
                field(CertificateofRegistration;"Certificate of Registration")
                {
                    ApplicationArea = Basic;
                }
                field(VATRegCertificate;"VAT Reg Certificate")
                {
                    ApplicationArea = Basic;
                }
                field(PINCertificate;"PIN Certificate")
                {
                    ApplicationArea = Basic;
                }
                field(TAXComplianceCertificate;"TAX Compliance Certificate")
                {
                    ApplicationArea = Basic;
                }
                field("3YearsExperience";"3 Years Experience")
                {
                    ApplicationArea = Basic;
                }
                field(SpecialServiceExperience;"Special Service/ Experience")
                {
                    ApplicationArea = Basic;
                }
            }
        }
    }

    actions
    {
    }
}

