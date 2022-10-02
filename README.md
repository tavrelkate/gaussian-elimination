This repo contains an implementation of "Gaussian elimination" and transform matrix to echelon form.
In mathematics, Gaussian elimination, also known as row reduction, is an algorithm for solving systems of linear equations. It consists of a sequence of operations performed on the corresponding matrix of coefficients. This method can also be used to compute the rank of a matrix, the determinant of a square matrix, and the inverse of an invertible matrix. 


## Basic Usage

Lets create a `matrix` object as array of arrays:

    matrix = [
        [1,  2,  3,  1],
        [2, -1,  2,  6],
        [1,  1,  5, -1]
      ]

Then we just need to pass it in `Matrix::GaussianElimination` instance and `build_echelon_form`:

    gaussian_elimination_matrix = Matrix::GaussianElimination.new(matrix).build_echelon_form

NOTES: `Matrix::GaussianElimination` dosent affect your original matrix.


## The algorithm

Transforming matrix to echelon form:
![alt text](https://www.researchgate.net/profile/P-Dewilde/publication/221349994/figure/fig1/AS:669052770975757@1536526019493/Example-of-an-echelon-form-Elements-indicated-with-a-are-strictly-positive-The-QR.png)

## Contacts

Contact me if you have any doubts or questions about this gem.

Email: tavrelkate@gmail.com
Telegram: @tavrelkate