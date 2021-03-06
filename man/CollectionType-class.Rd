\name{CollectionType-class}
\docType{class}
% CollectionType-class
\alias{CollectionType-class}
\alias{collectionType,CollectionType-method}
\alias{show,CollectionType-method}
\alias{CollectionIdType-class}
\alias{[,CollectionIdType,missing,missing-method}
\alias{Logic,CollectionType,CollectionType-method}
\alias{Logic,CollectionIdType,CollectionIdType-method}
\alias{|,CollectionType,CollectionType-method}
\alias{|,CollectionIdType,CollectionIdType-method}
\alias{&,CollectionType,CollectionType-method}
\alias{&,CollectionIdType,CollectionIdType-method}
\alias{show,CollectionIdType-method}
\alias{ids}
\alias{ids,CollectionIdType-method}
\alias{intersect,CollectionType,CollectionType-method}
\alias{intersect,CollectionIdType,CollectionIdType-method}
\alias{setdiff,CollectionType,CollectionType-method}
\alias{setdiff,CollectionIdType,CollectionIdType-method}
\alias{union,CollectionType,CollectionType-method}
\alias{union,CollectionIdType,CollectionIdType-method}
% NullCollection-class
\alias{NullCollection-class}
% ComputedCollection-class
\alias{ComputedCollection-class}
% ExpressionSetCollection-class
\alias{ExpressionSetCollection-class}
% BroadCollection-class
\alias{BroadCollection-class}
\alias{bcCategory,BroadCollection-method}
\alias{bcSubCategory,BroadCollection-method}
\alias{show,BroadCollection-method}
\alias{bcCategory}
\alias{bcSubCategory}
% GOCollection-class
\alias{GOCollection-class}
\alias{evidenceCode,GOCollection-method}
\alias{ontology,GOCollection-method}
\alias{goIds,GOCollection-method}
\alias{[,GOCollection,missing,missing-method}
\alias{show,GOCollection-method}
\alias{evidenceCode}
\alias{ontology}
\alias{goIds}
% KEGGCollection-class
\alias{KEGGCollection-class}
% additional classes
\alias{ChrCollection-class}
\alias{ChrlocCollection-class}
\alias{MapCollection-class}
\alias{OMIMCollection-class}
\alias{PMIDCollection-class} 
\alias{PfamCollection-class}
\alias{PrositeCollection-class}

\title{Class "CollectionType"}

\description{
  These classes provides a way to tag the origin of a
  \code{GeneSet}. Collection types can be used in manipulating
  (e.g., selecting) sets, and can contain information specific to
  particular sets (e.g., \code{category} and \code{subcategory}
  classifications of \code{BroadCollection}.)
}

\section{Objects from the Class}{
  The following classes can tag gene sets; \code{GO, KEGG, Chr, Chrloc,
    OMIM, and PMID} collections can be derived from chip or organism
  \sQuote{annotation} packages.

  \describe{
    \item{NullCollection}{No formal collection information available.}
    \item{BroadCollection}{Derived from, or destined to be, Broad
      XML. Usually created and written \code{\link{getBroadSets}},
      \code{\link{toBroadXML}}.}
    \item{ComputedCollection}{A computationally created collection, e.g.,
      by performing logic operations on gene sets.}
    \item{ExpressionSetCollection}{Derived from
      \code{\link[Biobase:class.ExpressionSet]{ExpressionSet}}. Usually
      created during a call to \code{\link{GeneSet}} or
      \code{\link{GeneColorSet}}.}
    \item{GOCollection}{Collection derived using Gene Ontology (GO)
      terms.}
    \item{OBOCollection}{Collection derived from \code{GOCollection},
      specifically from files described by the OBO file format. See
      \code{\linkS4class{OBOCollection}}}
    \item{KEGGCollection}{Collection derived using KEGG terms.}
    \item{ChrCollection}{Collection derived using chromsome locations}
    \item{ChrlocCollection}{Collection derived using chromosome starting
      posistions}
    \item{MapCollection}{Collection derived from cytogenic bands.}
    \item{OMIMCollection}{Collection derived from identifiers in the
      Online Inheritance in Man.}
    \item{PMIDCollection}{Collection derived from PMID identifiers.}
    \item{PfamCollection}{Collection derived from Pfam identifiers.}
    \item{PrositeCollection}{Collection derived from Prosite identifiers.}
  }

  Objects are instantiated with calls to \code{\link{CollectionType}}
  constructors, with slot names as possible arguments.
}

\section{Slots}{
  \code{CollectionType} classes (\code{Null, ComputedCollection,
    ExpressionSet}) have the slot:
  \describe{
    \item{\code{type}:}{Object of class \code{"ScalarCharacter"}
      containing the character string representation of this
      \code{CollectionType}.}
  }

  \code{CollectionIdType} classes (\code{KEGG, OMIM, PMID, Chr, Chrloc,
    Map, GO}) extend the \code{CollectionType} and have the additional
  slot:
  \describe{
    \item{\code{ids}:}{Object of class \code{"character"} containing a
      vector of character string representations of corresponding
      identifiers, e.g., \sQuote{KEGG} or \sQuote{GO} terms.}
  }

  \code{GOCollection} extends \code{CollectionIdType} and has the
  additional slot:
  \describe{
    \item{\code{evidenceCode}:}{Object of class \code{"character"},
      containing GO evidence codes used to construct the gene set.}
	\item{ontology}{Object of class \code{"character"} vector of GO
	  ontology terms used to filter GO terms in the GO Collection.}
  }
  The values of \code{evidenceCode} are
  \describe{
	\item{Experimental Evidence Codes}{
	  \describe{
		\item{EXP}{Inferred from Experiment}
		\item{IDA}{Inferred from Direct Assay}
		\item{IPI}{Inferred from Physical Interaction}
		\item{IMP}{Inferred from Mutant Phenotype}
		\item{IGI}{Inferred from Genetic Interaction}
		\item{IEP}{Inferred from Expression Pattern}
	  }
	}
	\item{Computational Analysis Evidence Codes}{
	  \describe{
		\item{ISS}{Inferred from Sequence or Structural Similarity}
		\item{ISO}{Inferred from Sequence Orthology}
		\item{ISA}{Inferred from Sequence Alignment}
		\item{ISM}{Inferred from Sequence Model}
		\item{IGC}{Inferred from Genomic Context}
		\item{RCA}{inferred from Reviewed Computational Analysis}
	  }
	}
	\item{Author Statement Evidence Codes}{
	  \describe{
		\item{TAS}{Traceable Author Statement}
		\item{NAS}{Non-traceable Author Statement}
	  }
	}
	\item{Curator Statement Evidence Codes}{
	  \describe{
		\item{IC}{Inferred by Curator}
		\item{ND}{No biological Data available}
	  }
	}
	\item{Automatically-assigned Evidence Codes}{
	  \describe{
		\item{IEA}{Inferred from Electronic Annotation}
	  }
	}
  }

  \code{OBOCollection} extends \code{GOCollection}; see
  \code{\linkS4class{OBOCollection}}.

  \code{BroadCollection} has slots:
  \describe{
     \item{\code{category}:}{Object of class \code{"ScalarCharacter"}
      containing terms from the Broad list of categories, or \code{NA}}
    \item{\code{subCategory}:}{Object of class \code{"ScalarCharacter"}
      containing Broad sub-categories, or \code{NA}}
  }
}

\section{Methods}{
  \code{CollectionType} classes have methods:
  \describe{
    \item{collectionType<-}{\code{signature(object = "GeneSet", value =
        "CollectionType")}: Replace the \code{CollectionType} }
    \item{collectionType}{\code{signature(object = "CollectionType")}:
      Retrieve the collection type.}
    \item{|, &, intersect, union, setdiff}{\code{signature(e1="CollectionType",
        e2="CollectionType")}: return \code{e1} when \code{class(e1)} and
      \code{class(e2)} are the same, or \code{ComputedCollection} when different.}
    \item{show}{\code{signature(object = "CollectionType")}: display the
      collection type.}
  }

  \code{CollectionIdType} classes inherit \code{CollectionType} methods,
  and have in addition:
  \describe{
    \item{ids}{\code{signature(object="CollectionIdType")}: Retrieve the
      identifiers of the collection type.}
    \item{[}{\code{signature(object="CollectionIdType", i="missing",
        j="missing", ..., ids=ids(object))}: return a subset of
      \code{object} containing only ids in \code{ids}}
    \item{|, &, intersect, union, setdiff}{
	  \code{signature(e1="CollectionIdType", e2="CollectionIdType")}:
	  always return \code{ComputedCollection}.}
  }

  \code{GOCollection} inherits \code{CollectionIdType} methods, and has
  in addition:
  \describe{
    \item{evidenceCode}{Retrieve the evidence codes of the GO
      collection.}
    \item{ontology}{Retrieve the ontology terms of the GO
      collection.}
    \item{[}{\code{signature(object="CollectionIdType", i="missing",
        j="missing", ..., evidenceCode=evidenceCode(object),
        ontology=ontology(object))}: return a subset of
      \code{object} containing only evidence and ontology codes in
      \code{evidenceCode}, \code{ontology}. This method passes
      arguments ... to \code{[,CollectionIdType} methods.}
  }

  \code{BroadCollection} has methods:
  \describe{
    \item{bcCategory}{Retrieve the \code{category} of the Broad
      collection.}
    \item{bcSubCategory}{Retrieve the sub-category of the Broad
      collection.}
  }
}

\author{Martin Morgan <mtmorgan@fhcrc.org>}
\seealso{
  \code{\link{CollectionType}} consturctors; \code{\link{getBroadSets}}
  for importing collections from the Broad (and sources).
}
\examples{
names(getClass("CollectionType")@subclasses)

## Create a CollectionType and ask for its type
collectionType(ExpressionSetCollection())

## Read two GeneSets from a Broad XML file into a list, verify that
## they are both BroadCollection's. Category / subcategory information
## is unique to Broad collections.
fl <- system.file("extdata", "Broad.xml", package="GSEABase")
sets <- getBroadSets(fl)
sapply(sets, collectionType)

## ExpressionSets are tagged with ExpressionSetCollection; there is no
## 'category' information.
data(sample.ExpressionSet)
gs <- GeneSet(sample.ExpressionSet[100:109],
              setName="sample.GeneSet", setIdentifier="123")
collectionType(gs)

## GOCollections are created by reference to GO terms and evidenceCodes
GOCollection("GO:0005488")
## requires library(GO); EntrezIdentifers automatically created
\dontrun{
GeneSet(GOCollection(c("GO:0005488", "GO:0019825"),
                     evidenceCode="IDA"))
}
}
\keyword{classes}
